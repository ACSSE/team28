CREATE SCHEMA `CustomManDB` ;



CREATE TABLE `custommandb`.`usertype` (
  `usertype_id` INT NOT NULL AUTO_INCREMENT,
  `usertype_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usertype_id`));

  
  
  CREATE TABLE `custommandb`.`producttype` (
  `producttype_id` INT NOT NULL AUTO_INCREMENT,
  `producttype_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`producttype_id`));
  
  
  
  CREATE TABLE `custommandb`.`warehousetype` (
  `warehousetype_id` INT NOT NULL AUTO_INCREMENT,
  `warehousetype_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`warehousetype_id`));

  
  CREATE TABLE `custommandb`.`productlogtype` (
  `productlogtype_id` INT NOT NULL AUTO_INCREMENT,
  `productlogtype_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`productlogtype_id`));

  
  
 	CREATE TABLE `custommandb`.`hscode` (
  `hscode_id` INT NOT NULL,
  `hscode_percentage` DECIMAL NULL,
  PRIMARY KEY (`hscode_id`));
 
 

    CREATE TABLE `custommandb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(45) NULL,
  `user_fname` VARCHAR(45) NULL,
  `user_sname` VARCHAR(45) NULL,
  `user_password` LONGTEXT NULL,
  `usertype_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC),
  INDEX `usertype_id_idx` (`usertype_id` ASC),
  CONSTRAINT `usertype_id`
    FOREIGN KEY (`usertype_id`)
    REFERENCES `custommandb`.`usertype` (`usertype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
CREATE TABLE `custommandb`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `product_price` DECIMAL NULL,
  `product_quantity` INT NULL,
  `product_size` INT NULL,
  `product_location` VARCHAR(100) NULL,
  `product_arrivalDate` DATETIME NULL,
  `product_width` INT NULL,
  `product_height` INT NULL,
  `product_length` INT NULL,
  `product_producttype` INT NULL,
  `product_hscode` INT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `product_producttype_idx` (`product_producttype` ASC),
  INDEX `product_hscode_idx` (`product_hscode` ASC),
  CONSTRAINT `product_producttype`
    FOREIGN KEY (`product_producttype`)
    REFERENCES `custommandb`.`producttype` (`producttype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_hscode`
    FOREIGN KEY (`product_hscode`)
    REFERENCES `custommandb`.`hscode` (`hscode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
	CREATE TABLE `custommandb`.`warehouse` (
  `warehouse_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse_name` VARCHAR(45) NULL,
  `warehouse_location` VARCHAR(100) NULL,
  `warehouse_size` INT NULL,
  `warehouse_user` INT NULL,
  `warehouse_warehousetype` INT NULL,
  PRIMARY KEY (`warehouse_id`),
  UNIQUE INDEX `warehouse_name_UNIQUE` (`warehouse_name` ASC),
  INDEX `billofentry_user_idx` (`warehouse_user` ASC),
  INDEX `warehouse_warehousetype_idx` (`warehouse_warehousetype` ASC),
  CONSTRAINT `warehouse_user`
    FOREIGN KEY (`warehouse_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehouse_warehousetype`
    FOREIGN KEY (`warehouse_warehousetype`)
    REFERENCES `custommandb`.`warehousetype` (`warehousetype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `custommandb`.`countryrelation` (
  `countryrelation_id` INT NOT NULL AUTO_INCREMENT,
  `countryrelation_name` VARCHAR(45) NULL,
  PRIMARY KEY (`countryrelation_id`));
  
  
CREATE TABLE `custommandb`.`invoice` (
  `invoice_id` INT(45) NOT NULL AUTO_INCREMENT,
  `invoice_vat` DECIMAL(10,2) NULL,
  `invoice_penalty` DECIMAL(10,2) NULL,
  `invoice_paid` DECIMAL(10,2) NULL,
  PRIMARY KEY (`invoice_id`));
	
	
CREATE TABLE `custommandb`.`billofentry` (
  `billofentry_id` INT NOT NULL AUTO_INCREMENT,
  `billofentry_code` VARCHAR(45) NULL,
  `billofentry_user` INT NULL,
  `billofentry_product` INT NULL,
  `billofentry_origin` VARCHAR(45) NULL,
  `billofentry_invoice` INT(45) NULL,
  PRIMARY KEY (`billofentry_id`),
  INDEX `billofentry_user_idx` (`billofentry_user` ASC),
  INDEX `billofentry_product_idx` (`billofentry_product` ASC),
  INDEX `billofentry_invoice_idx` (`billofentry_invoice` ASC),
  CONSTRAINT `billofentry_user`
    FOREIGN KEY (`billofentry_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `billofentry_product`
    FOREIGN KEY (`billofentry_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `billofentry_invoice`
    FOREIGN KEY (`billofentry_invoice`)
    REFERENCES `custommandb`.`invoice` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
	
CREATE TABLE `custommandb`.`productlog` (
  `productlog_id` INT NOT NULL AUTO_INCREMENT,
  `productlog_product` INT NULL,
  `productlog_warehouse` INT NULL,
  `productlog_user` INT NULL,
  `productlog_dscription` VARCHAR(255) NULL,
  `productlog_dateLogged` DATETIME NULL,
  `productlog_image` LONGTEXT NULL,
  `productlog_type` INT NULL,
  PRIMARY KEY (`productlog_id`),
  INDEX `productlog_product_idx` (`productlog_product` ASC),
  INDEX `productlog_user_idx` (`productlog_user` ASC),
  INDEX `productlog_type_idx` (`productlog_type` ASC),
  CONSTRAINT `productlog_product`
    FOREIGN KEY (`productlog_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	 CONSTRAINT `productlog_warehouse`
    FOREIGN KEY (`productlog_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_user`
    FOREIGN KEY (`productlog_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_type`
    FOREIGN KEY (`productlog_type`)
    REFERENCES `custommandb`.`productlogtype` (`productlogtype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


	
	CREATE TABLE `custommandb`.`transferrequest` (
  `transferrequest_id` INT NOT NULL AUTO_INCREMENT,
  `transferrequest_from` VARCHAR(45) NULL,
  `transferrequest_to` VARCHAR(45) NULL,
  `transferrequest_verdict` VARCHAR(45) NULL,
  `transferrequest_user` INT NULL,
  `transferrequest_product` INT NULL,
  PRIMARY KEY (`transferrequest_id`),
  INDEX `transferrequest_user_idx` (`transferrequest_user` ASC),
  INDEX `transferrequest_product_idx` (`transferrequest_product` ASC),
  CONSTRAINT `transferrequest_user`
    FOREIGN KEY (`transferrequest_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transferrequest_product`
    FOREIGN KEY (`transferrequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `custommandb`.`releaserequest` (
  `releaserequest_id` INT NOT NULL AUTO_INCREMENT,
  `releaserequest_verdict` VARCHAR(45) NULL,
  `releaserequest_user` INT NULL,
  `releaserequest_product` INT NULL,
  PRIMARY KEY (`releaserequest_id`),
  INDEX `releaserequest_user_idx` (`releaserequest_user` ASC),
  INDEX `releaserequest_product_idx` (`releaserequest_product` ASC),
  CONSTRAINT `releaserequest_user`
    FOREIGN KEY (`releaserequest_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `releaserequest_product`
    FOREIGN KEY (`releaserequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `custommandb`.`warehousestock` (
  `warehousestock_id` INT NOT NULL AUTO_INCREMENT,
  `warehousestock_lastchecked` DATETIME NULL,
  `warehousestock_warehouse` INT NULL,
  `warehousestock_product` INT NULL,
  PRIMARY KEY (`warehousestock_id`),
  INDEX `warehousestock_warehouse_idx` (`warehousestock_warehouse` ASC),
  INDEX `warehousestock_product_idx` (`warehousestock_product` ASC),
  CONSTRAINT `warehousestock_warehouse`
    FOREIGN KEY (`warehousestock_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehousestock_product`
    FOREIGN KEY (`warehousestock_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `custommandb`.`transferlist` (
  `transferlist_id` INT NOT NULL AUTO_INCREMENT,
  `transferlist_to` VARCHAR(45) NULL,
  `transferlist_from` VARCHAR(45) NULL,
  `transferlist_product` INT NULL,
  PRIMARY KEY (`transferlist_id`),
  INDEX `transferlist_product_idx` (`transferlist_product` ASC),
  CONSTRAINT `transferlist_product`
    FOREIGN KEY (`transferlist_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
     CREATE TABLE `custommandb`.`Location` (
    `location_id` INT NOT NULL AUTO_INCREMENT,
    `location_isle` INT NULL,
    `location_column` INT NULL,
    `location_row` INT NULL,
    `location_size` INT NULL,
    `location_product` INT NULL,
    `location_warehouse` INT NULL,
    `location_height` INT NULL,
    `location_width` INT NULL,
    `location_length` INT NULL,
    PRIMARY KEY (`location_id`),
    INDEX `location_warehouse_idx` (`location_warehouse` ASC),
     INDEX `location_product_idx` (`location_product` ASC),  
     CONSTRAINT `location_warehouse`
    FOREIGN KEY (`location_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
     CONSTRAINT `location_product`
    FOREIGN KEY (`location_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

	
	CREATE TABLE `custommandb`.`message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `message_convoid` INT NULL,
  `message_to` INT NULL,
  `message_from` INT NULL,
  `message_message` LONGTEXT NULL,
  `message_stamp` DATETIME NULL,
  PRIMARY KEY (`message_id`),
  INDEX `message_to_idx` (`message_to` ASC),
  INDEX `message_from_idx` (`message_from` ASC),
  CONSTRAINT `message_to`
    FOREIGN KEY (`message_to`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `message_from`
    FOREIGN KEY (`message_from`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `custommandb`.`ownershiprequest` (
  `ownershiprequest_id` INT NOT NULL AUTO_INCREMENT,
  `ownershiprequest_owner` INT NULL,
  `ownershiprequest_newowner` INT NULL,
  `ownershiprequest_acceptance` VARCHAR(45) NULL,
  PRIMARY KEY (`ownershiprequest_id`),
  INDEX `ownershiprequest_owner_idx` (`ownershiprequest_owner` ASC),
  INDEX `ownershiprequest_newowner_idx` (`ownershiprequest_newowner` ASC),
  CONSTRAINT `ownershiprequest_owner`
    FOREIGN KEY (`ownershiprequest_owner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ownershiprequest_newowner`
    FOREIGN KEY (`ownershiprequest_newowner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	ALTER TABLE `custommandb`.`ownershiprequest` 
ADD COLUMN `ownershiprequest_product` INT NULL AFTER `ownershiprequest_acceptance`,
ADD INDEX `ownsershiprequest_product_idx` (`ownershiprequest_product` ASC);
ALTER TABLE `custommandb`.`ownershiprequest` 
ADD CONSTRAINT `ownsershiprequest_product`
  FOREIGN KEY (`ownershiprequest_product`)
  REFERENCES `custommandb`.`product` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('1', 'Client');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('2', 'Custom');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('3', 'Warehouse');

INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('1', 'Duty Free');
INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('2', 'Duty');


INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('825', '14');


INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`) VALUES ('China');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`) VALUES ('USA');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`) VALUES ('Japan');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`) VALUES ('UK');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`) VALUES ('Australia');


INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('1', 'Ordinary Storage (OS)');
INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('2', 'Special Ordinary Storage (SOS)');


INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('I9');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('TR7');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('RR6');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('T2');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('D3');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('CO2');


INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client@gmail', 'Client', 'client', 'client', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs@gmail', 'Customs', 'customs', 'customs', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse@gmail', 'Warehouse', 'warehouse', 'warehouse', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client1@gmail', 'Client1', 'client1', 'client1', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse1@gmail', 'Warehouse1', 'warehouse1', 'warehouse1', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client2@gmail', 'Client2', 'client2', 'client2', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs2@gmail', 'Customs2', 'customs2', 'customs2', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse2@gmail', 'Warehouse2', 'warehouse2', 'warehouse2', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client3@gmail', 'Client3', 'client3', 'client3', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse3@gmail', 'Warehouse3', 'warehouse3', 'warehouse3', '3');


INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Tubes and Pipes', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2014-12-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Conveyor Belts', '19999', '10', '3', 'in Transit', '2016-02-02 15:55:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Apple Mackbooks', '1500000', '150', '30', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good A', '19999', '10', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-02-02 15:55:41', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good B', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2015-11-01 12:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good C', '19999', '10', '3', 'in Transit', '2016-01-02 15:05:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good D', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2016-02-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good E', '19999', '10', '3', 'in Transit', '2015-12-02 15:55:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good F', '88000', '5', '13', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-05-01 17:50', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good G', '19999', '10', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-01-03 15:55:41', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good H', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2015-12-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good I', '19999', '10', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-01-02 15:55:41', '2', '825');


INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`) VALUES ('DS Space', '11 Eva Road, Benoni, 1512', '500', '3', '1');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`) VALUES ('DHL Express Warehouse', '48 Hoylake Road, Randburg, 2034', '650', '5', '2');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`) VALUES ('Old Storage', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '800', '8', '1');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`) VALUES ('Mount Warehousing', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '1400', '10', '2');


INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-08-08 13:32:00 ', '1', '1');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-06-08 11:32:00 ', '3', '3');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-08-08 13:32:00 ', '3', '4');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-05-08 12:32:00 ', '3', '5');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-08-08 13:32:00 ', '1', '7');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-08-08 13:32:00 ', '1', '9');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-04-08 10:32:00 ', '4', '10');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-07-08 13:02:00 ', '3', '11');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('2016-08-01 15:32:00 ', '2', '12');


INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '1', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('D4569', '4', '2', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '6', '3', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '9', '4', 'Korea');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '4', '5', 'Australia');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CD456', '1', '6', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '7', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '6', '8', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '1', '9', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '10', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '6', '11', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '9', '12', 'UK');


INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '4', 'Pending', '1');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('4', '6', 'Pending', '2');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('6', '9', 'Pending', '3');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('4', '1', 'Pending', '5');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('6', '1', 'Pending', '11');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('9', '4', 'Pending', '12');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('6', '1', 'Pending', '8');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '9', 'Pending', '10');


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_dscription`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Delivered : Package was delivered to the warehouse', '2016-08-08 13:40:32', '5');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_dscription`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Transfer Request : A Transfer Request was issued by the owner of the package', '2016-08-08 18:01:25', '2');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_dscription`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Release Request: A release request has been issued by the owner of the package', '2016-08-08 18:05:22', '3');


INSERT INTO `custommandb`.`releaserequest` (`releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`) VALUES ('Pending', '1', '1');


INSERT INTO `custommandb`.`transferrequest` (`transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', 'Pending...', '1', '1');


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_dscription`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', '3', 'Transfer: Package has been transfered to DHL Express Warehouse at 48 Hoylake Road, Randburg, 2034', '2016-07-03 11:14:02', '4');


INSERT INTO `custommandb`.`transferlist` (`transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('48 Hoylake Road, Randburg, 2034', '11 Eva Road, Benoni, 1512', '2');
