CREATE TABLE Location (
    location_id INT PRIMARY KEY IDENTITY(1,1),
    city NVARCHAR(50),
    area NVARCHAR(50),
    country NVARCHAR(50)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50)
);

CREATE TABLE [User] (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email NVARCHAR(100) UNIQUE,
    password NVARCHAR(100),
    phone NVARCHAR(20),
    role NVARCHAR(20),
    status NVARCHAR(20),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Ad (
    ad_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(100),
    description NVARCHAR(MAX),
    price DECIMAL(18,2),
    status NVARCHAR(20),
    views_count INT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    user_id INT FOREIGN KEY REFERENCES [User](user_id),
    category_id INT FOREIGN KEY REFERENCES Category(category_id),
    location_id INT FOREIGN KEY REFERENCES Location(location_id)
);

CREATE TABLE AdImage (
    image_id INT PRIMARY KEY IDENTITY(1,1),
    ad_id INT FOREIGN KEY REFERENCES Ad(ad_id),
    image_url NVARCHAR(MAX)
);

CREATE TABLE AdAttribute (
    attribute_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50),
    category_id INT FOREIGN KEY REFERENCES Category(category_id)
);

CREATE TABLE AdAttributeValue (
    ad_id INT FOREIGN KEY REFERENCES Ad(ad_id),
    attribute_id INT FOREIGN KEY REFERENCES AdAttribute(attribute_id),
    value NVARCHAR(MAX),
    PRIMARY KEY (ad_id, attribute_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY IDENTITY(1,1),
    writer_id INT FOREIGN KEY REFERENCES [User](user_id),
    target_user_id INT FOREIGN KEY REFERENCES [User](user_id),
    ad_id INT FOREIGN KEY REFERENCES Ad(ad_id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Favorite (
    user_id INT FOREIGN KEY REFERENCES [User](user_id),
    ad_id INT FOREIGN KEY REFERENCES Ad(ad_id),
    PRIMARY KEY (user_id, ad_id)
);