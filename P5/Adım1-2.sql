UPDATE Application.People
SET PhoneNumber = REPLACE(REPLACE(REPLACE(PhoneNumber, '(', ''), ')', ''), '-', '')
WHERE PhoneNumber IS NOT NULL;

-- Hatal� Telefon Numaralar�n� D�zelt