CREATE TABLE users (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(128) NOT NULL,
    alamat TEXT NOT NULL,
    email VARCHAR(128) NOT NULL,
    phone_number VARCHAR(15),
    image VARCHAR(128) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT(11) NOT NULL,
    last_login TIMESTAMP, -- Kolom untuk menyimpan waktu terakhir login
    is_active BOOLEAN DEFAULT TRUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    wedding_date DATETIME,
    alamat TEXT NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE events (
    events_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(128) NOT NULL
);
INSERT INTO `role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'member');

CREATE TABLE packages (
    paket_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_paket VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    harga DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    booking_date DATE NOT NULL,
    event_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Tunda', 'Selesai', 'Dibatalkan') NOT NULL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE booking_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    package_id INT,
    vendor_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Transfer','Tunai') NOT NULL,
    status ENUM('Tunda', 'Selesai', 'Dibatalkan') NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,  
    customer_id INT,                          
    event_date DATE NOT NULL,                 
    total_amount DECIMAL(10, 2) NOT NULL,    
    order_status ENUM('pending', 'confirmed', 'cancelled') NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)  
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,  
    order_id INT,                                  
    service_id INT,                                 
    service_name VARCHAR(255),                      
    quantity INT,                                   
    price DECIMAL(10, 2),                           
    total_price DECIMAL(10, 2),                     
    FOREIGN KEY (order_id) REFERENCES orders(order_id),  
    FOREIGN KEY (service_id) REFERENCES services(service_id)  
);

