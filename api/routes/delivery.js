const express = require('express')
const router = express.Router();
const { query, validationResult, body } = require('express-validator');
const pool=require('../db');

router.post('/price', [
    body('zone', 'Enter valid zone').isLength({ min: 3 }),
    body('organization_id', 'Enter valid organisation_id').isLength({ min: 1 }),
    body('total_distance', 'Enter valid total_distance').isLength({ min: 1 }),
    body('item_id', 'Enter valid item_type').isLength({ min: 1 })
], async (req, res) => {

    //checks the proper type in request and return errors
    const errors = validationResult(req);
    if (!errors.isEmpty()) {

        return res.status(400).json({errors: errors.array() });
    }

    // Extracting request body parameters
        const { zone, organization_id, total_distance, item_id } = req.body;
    
        try {
            // Fetch pricing information from the database
            const query = `
              SELECT km_price, fix_price, base_distance_in_km 
              FROM my_database_schema.pricing 
              WHERE organization_id = $1 AND item_id = $2 AND zone = $3;
            `;
            const { rows } = await pool.query(query, [organization_id, item_id, zone]);
        
            if (rows.length === 0) {
              return res.status(404).json({ error: 'Pricing not found for the given parameters' });
            }
        
            const { km_price, fix_price, base_distance_in_km } = rows[0];

            const km_price_int = parseInt(km_price, 10);
            const fix_price_int = parseInt(fix_price, 10);
            const base_distance_in_km_int = parseInt(base_distance_in_km, 10);

            // Calculate delivery cost
            let totalCost = fix_price_int; // Base price
        
            if (total_distance > base_distance_in_km_int) {
              const additionalDistance = total_distance - base_distance_in_km_int;
              totalCost = (fix_price_int) + (additionalDistance * km_price_int);
            }
        
            res.status(200).json({"total_price":totalCost});
            
          } catch (error) {
            console.error('Error calculating delivery cost:', error);
            res.status(500).json({ error: 'Internal Server Error' });
          }

})
module.exports = router;