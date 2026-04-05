const restaurants = [
  {
    id: "rest_001",
    name: "Sharma Fast Food",
    imageUrl: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1",
    address: "Near CU Gate 2",
    phone: "9876543210",
    lat: 30.765,
    lng: 76.575,
    rating: 4.2,
    avgWaitTime: 7,
    isOpen: true,
  },
  {
    id: "rest_002",
    name: "Campus Wraps",
    imageUrl: "https://images.unsplash.com/photo-1626804475297-41609ea0dc4eb",
    address: "Hostel Lane",
    phone: "9876543211",
    lat: 30.766,
    lng: 76.578,
    rating: 4.6,
    avgWaitTime: 5,
    isOpen: true,
  }
];

const menuItems = [
  // SNACKS
  { id: 'm1', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Burger', price: 50, isVeg: true, isAvailable: true },
  { id: 'm2', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Cheese Burger', price: 60, isVeg: true, isAvailable: true },
  { id: 'm3', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Noodles', price: 80, isVeg: true, isAvailable: true },
  { id: 'm4', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Hakka Noodles', price: 90, isVeg: true, isAvailable: true },
  { id: 'm5', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Cheese Noodles', price: 100, isVeg: true, isAvailable: true },
  { id: 'm6', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Spring Roll', price: 60, isVeg: true, isAvailable: true },
  { id: 'm7', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Fried/Steamed Momos', price: 60, isVeg: true, isAvailable: true },
  { id: 'm8', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Maggi', price: 40, isVeg: true, isAvailable: true },
  { id: 'm9', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'French Fries', price: 60, isVeg: true, isAvailable: true },
  { id: 'm10', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Chilli Potato', price: 100, isVeg: true, isAvailable: true },
  { id: 'm11', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'White Sauce Pasta', price: 90, isVeg: true, isAvailable: true },
  
  // SANDWICHES
  { id: 'm12', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Veg Grilled Sandwich', price: 60, isVeg: true, isAvailable: true },
  { id: 'm13', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Paneer Korma Sandwich', price: 90, isVeg: true, isAvailable: true },
  { id: 'm14', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Cheese Sandwich', price: 80, isVeg: true, isAvailable: true },
  
  // INDIAN FOOD
  { id: 'm15', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Rajma Rice', price: 60, isVeg: true, isAvailable: true },
  { id: 'm16', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Fried Rice', price: 80, isVeg: true, isAvailable: true },
  { id: 'm17', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Aloo Prantha with Butter', price: 45, isVeg: true, isAvailable: true },

  // SHAKES & BEVERAGES
  { id: 'm18', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Kitkat Shake', price: 70, isVeg: true, isAvailable: true },
  { id: 'm19', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Oreo Shake', price: 70, isVeg: true, isAvailable: true },
  { id: 'm20', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Cold Coffee', price: 60, isVeg: true, isAvailable: true },
  { id: 'm21', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Sweet Lassi', price: 30, isVeg: true, isAvailable: true },
  { id: 'm22', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Virgin Mojito', price: 60, isVeg: true, isAvailable: true },
  { id: 'm23', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Tea', price: 15, isVeg: true, isAvailable: true },
  { id: 'm24', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Aloo Patty', price: 20, isVeg: true, isAvailable: true },

  // NON VEG & EGGS
  { id: 'm25', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Egg Noodles', price: 100, isVeg: false, isAvailable: true },
  { id: 'm26', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Egg Fried Rice', price: 100, isVeg: false, isAvailable: true },
  { id: 'm27', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Egg Bhurji (2 Egg)', price: 50, isVeg: false, isAvailable: true },
];

module.exports = { restaurants, menuItems };
