const express = require('express');
const cors = require('cors');
const { restaurants, menuItems } = require('./data');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Root path for browser test
app.get('/', (req, res) => {
  res.send('<h1>PocketBite Backend is Running! 🚀</h1><p>Try visiting <a href="/api/restaurants">/api/restaurants</a> or <a href="/api/search?q=burger">/api/search?q=burger</a></p>');
});

// 1) Get all nearby restaurants
app.get('/api/restaurants', (req, res) => {
  res.json({
    success: true,
    data: restaurants
  });
});

// 2) Get specific restaurant details
app.get('/api/restaurants/:id', (req, res) => {
  const restaurant = restaurants.find(r => r.id === req.params.id);
  if (restaurant) {
    res.json({ success: true, data: restaurant });
  } else {
    res.status(404).json({ success: false, message: 'Restaurant not found' });
  }
});

// 3) Search food comparison across all restaurants
app.get('/api/search', (req, res) => {
  const query = req.query.q?.toLowerCase() || '';
  
  if (!query) {
    return res.json({ success: true, data: [] });
  }

  // Find matching menu items
  const matches = menuItems.filter(item => 
    item.foodName.toLowerCase().includes(query)
  );

  // Attach restaurant info to each match
  const results = matches.map(item => {
    const rest = restaurants.find(r => r.id === item.restaurantId);
    return {
      ...item,
      // Pass restaurant details so frontend can calculate distance or use predefined wait times
      restaurantLat: rest?.lat,
      restaurantLng: rest?.lng,
      avgWaitTime: rest?.avgWaitTime,
      restaurantRating: rest?.rating
    };
  });

  res.json({
    success: true,
    data: results
  });
});

// 4) Get all menu items for a specific restaurant
app.get('/api/menu/:restaurantId', (req, res) => {
  const items = menuItems.filter(m => m.restaurantId === req.params.restaurantId);
  res.json({
    success: true,
    data: items
  });
});

app.listen(PORT, () => {
  console.log(`PocketBite Backend running on http://localhost:${PORT}`);
});
