-------sessões--------

CREATE TABLE user_sessions (
    sessionId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    loginAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    logoutAt DATETIME NULL,
    ipAddress VARCHAR(45),

    FOREIGN KEY (userId) REFERENCES users(userId)
);
