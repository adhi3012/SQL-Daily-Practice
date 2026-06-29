
-- Insert sample data
INSERT INTO prices VALUES
-- Apple: consistently rising every day (PASS)
('Apple', '2024-01-01', 10.00),
('Apple', '2024-01-02', 12.00),
('Apple', '2024-01-03', 15.00),
('Apple', '2024-01-04', 18.00),

-- Banana: rises then drops on day 3 (FAIL)
('Banana', '2024-01-01', 20.00),
('Banana', '2024-01-02', 25.00),
('Banana', '2024-01-03', 22.00),
('Banana', '2024-01-04', 28.00),

-- Cherry: flat on day 2 (not strictly increasing) (FAIL)
('Cherry', '2024-01-01', 30.00),
('Cherry', '2024-01-02', 30.00),
('Cherry', '2024-01-03', 35.00),

-- Dates: drops on day 2, then recovers (FAIL)
('Dates', '2024-01-01', 50.00),
('Dates', '2024-01-02', 45.00),
('Dates', '2024-01-03', 60.00),

-- Elderberry: only 1 day of data, no comparison possible (EXCLUDED - no next_price)
('Elderberry', '2024-01-01', 80.00),

-- Fig: consistently rising, only 2 days (PASS)
('Fig', '2024-01-01', 5.00),
('Fig', '2024-01-02', 9.00);