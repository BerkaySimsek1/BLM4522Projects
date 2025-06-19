UPDATE Application.People
SET PhoneNumber = REPLACE(REPLACE(REPLACE(PhoneNumber, '(', ''), ')', ''), '-', '')
WHERE PhoneNumber IS NOT NULL;

-- Hatalý Telefon Numaralarýný Düzelt