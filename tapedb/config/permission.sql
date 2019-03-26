CREATE USER 'www'@'localhost';
GRANT SELECT ON disk_archive.* TO 'www'@'localhost';
GRANT SELECT ON tape_archive_tapes.* TO 'www'@'localhost';
