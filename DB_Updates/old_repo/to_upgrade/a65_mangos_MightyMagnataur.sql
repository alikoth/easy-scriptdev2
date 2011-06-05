-- Spawns & waypoint
DELETE FROM creature_movement WHERE id IN (SELECT guid FROM creature WHERE id IN (27007,27009));
INSERT INTO creature_movement VALUES
-- Iceshatter (entry:27007)
('11000000','1','3670.87','-167.885','59.9313','0','0','0','0','0','0','0','0','0','5.48787','0','0'),
('11000000','2','3692.01','-186.544','60.4833','0','0','0','0','0','0','0','0','0','5.53107','0','0'),
('11000000','3','3679.82','-227.978','59.6744','0','0','0','0','0','0','0','0','0','4.42758','0','0'),
('11000000','4','3695.13','-194.953','60.3994','0','0','0','0','0','0','0','0','0','1.13676','0','0'),
('11000000','5','3672.29','-167.336','60.2317','0','0','0','0','0','0','0','0','0','2.2481','0','0'),
('11000000','6','3672.99','-138.921','59.6748','0','0','0','0','0','0','0','0','0','1.5059','0','0'),
('11000000','7','3653.82','-114.319','59.8661','0','0','0','0','0','0','0','0','0','2.05568','0','0'),
('11000000','8','3677.09','-136.782','60.0845','0','0','0','0','0','0','0','0','0','5.51536','0','0'),
-- Drakegore (entry: 27009) already spawned in UDB so using guid
('107705','1','4185.73','-165.917','68.6561','0','0','0','0','0','0','0','0','0','5.56696','0','0'),
('107705','2','4215.21','-188.557','71.4034','0','0','0','0','0','0','0','0','0','5.60623','0','0'),
('107705','3','4247.68','-227.593','70.788','0','0','0','0','0','0','0','0','0','5.48057','0','0'),
('107705','4','4223.41','-198.662','70.9498','0','0','0','0','0','0','0','0','0','2.26043','0','0'),
('107705','5','4197.02','-172.397','70.5039','0','0','0','0','0','0','0','0','0','2.49212','0','0'),
('107705','6','4139.54','-153.031','61.606','0','0','0','0','0','0','0','0','0','2.85341','0','0'),
('107705','7','4083.35','-158.069','56.1427','0','0','0','0','0','0','0','0','0','3.22647','0','0'),
('107705','8','4127.51','-157.487','60.2522','0','0','0','0','0','0','0','0','0','6.26203','0','0'),
('107705','9','4159.2','-158.556','65.3065','0','0','0','0','0','0','0','0','0','6.2424','0','0');
DELETE FROM creature WHERE id IN (27007);
INSERT INTO creature VALUES
('11000000','27007','571','1','1','0','0','3671.88','-168.654','60.0343','0.670539','25','0','0','24850','3387','0','2');

-- AI scripts
UPDATE creature_template SET AIName = 'EventAI' WHERE entry IN (27007,27008,27009);

DELETE FROM creature_ai_scripts WHERE creature_id IN (27007,27008,27009);
INSERT INTO creature_ai_scripts VALUES
('2700701','27007', '4','0','100','0', '0','0','0','0', '11','52088','1','1', '0','0','0','0', '0','0','0','0', 'Iceshatter - Magnataur Charge'),
('2700702','27007', '0','0','80','1', '10000','20000','30000','30000', '11','52118','0','0', '0','0','0','0', '0','0','0','0', 'Iceshatter - Pulsing Shards'),

('2700801','27008', '0','0','100','1', '10000','20000','30000','30000', '11','52126','1','1', '0','0','0','0', '0','0','0','0', 'Bloodfeast - Incite Maggots'),

('2700901','27009', '4','0','100','0', '0','0','0','0', '11','52088','1','1', '0','0','0','0', '0','0','0','0', 'Drakegore - Magnataur Charge'),
('2700902','27009', '0','0','80','1', '10000','20000','30000','30000', '11','52101','0','0', '0','0','0','0', '0','0','0','0', 'Drakegore - Burning Fists');