CREATE TABLE Conversation (
    conversation_id INT PRIMARY KEY IDENTITY(1,1),
    ad_id INT,        
    buyer_id INT,    
    seller_id INT,    
    created_at DATETIME DEFAULT GETDATE()
);


CREATE TABLE Message (
    message_id INT PRIMARY KEY IDENTITY(1,1),
    conversation_id INT FOREIGN KEY REFERENCES Conversation(conversation_id),
    sender_id INT,   
    content NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);


CREATE TABLE Report (
    report_id INT PRIMARY KEY IDENTITY(1,1),
    target_type NVARCHAR(20),
    target_id INT,           
    reason NVARCHAR(MAX),
    status NVARCHAR(20),
    reporter_id INT,         
    created_at DATETIME DEFAULT GETDATE(),
    resolved_at DATETIME
);

CREATE TABLE ReportAction (
    action_id INT PRIMARY KEY IDENTITY(1,1),
    report_id INT FOREIGN KEY REFERENCES Report(report_id),
    admin_id INT,           
    action_taken NVARCHAR(MAX),
    taken_at DATETIME DEFAULT GETDATE()
);