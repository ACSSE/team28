CREATE SCHEMA `custommandb` ;

CREATE TABLE `custommandb`.`usertype` (
  `usertype_id` INT NOT NULL AUTO_INCREMENT,
  `usertype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`usertype_id`));

  CREATE TABLE `custommandb`.`producttype` (
  `producttype_id` INT NOT NULL AUTO_INCREMENT,
  `producttype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`producttype_id`));

  
  CREATE TABLE `custommandb`.`warehousetype` (
  `warehousetype_id` INT NOT NULL AUTO_INCREMENT,
  `warehousetype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`warehousetype_id`));

  CREATE TABLE `custommandb`.`productlogtype` (
  `productlogtype_id` INT NOT NULL AUTO_INCREMENT,
  `productlogtype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`productlogtype_id`));

  CREATE TABLE `custommandb`.`hscode` (
  `hscode_id` INT NOT NULL AUTO_INCREMENT,
  `hscode_percentage` DECIMAL NOT NULL,
  PRIMARY KEY (`hscode_id`));

  CREATE TABLE `custommandb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(255) NULL,
  `user_fname` VARCHAR(255) NULL,
  `user_sname` VARCHAR(255) NULL,
  `user_password` LONGTEXT NULL,
  `usertype_id` INT NULL,
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
  `product_name` VARCHAR(255) NULL,
  `product_price` DECIMAL(10,0) NULL,
  `product_quantity` INT NULL,
  `product_size` INT NULL,
  `product_location` VARCHAR(255) NULL,
  `product_arrivalDate` DATETIME NULL,
  `product_width` INT NULL,
  `product_height` INT NULL,
  `product_length` INT NULL,
  `product_producttype` INT NULL,
  `product_hscode` INT NULL,
  `product_image` LONGTEXT NULL,
  `product_exitdate` DATETIME NULL,
  `product_Expired` VARCHAR(255) NULL,
  `product_receipt` VARCHAR(255) NULL,
  `product_description` VARCHAR(255) NULL,
  `product_expirationDate` DATETIME NULL,
  PRIMARY KEY (`product_id`),
  INDEX `product_producttype_idx` (`product_producttype` ASC),
  INDEX `product_hscode_idx` (`product_hscode` ASC),
  CONSTRAINT `product_hscode`
    FOREIGN KEY (`product_hscode`)
    REFERENCES `custommandb`.`hscode` (`hscode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_producttype`
    FOREIGN KEY (`product_producttype`)
    REFERENCES `custommandb`.`producttype` (`producttype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `custommandb`.`warehouse` (
  `warehouse_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse_name` VARCHAR(255) NULL,
  `warehouse_location` VARCHAR(255) NULL,
  `warehouse_size` INT NULL,
  `warehouse_user` INT NULL,
  `warehouse_isles` INT NULL,
  `warehouse_warehousetype` INT NULL,
  `warehouse_image` VARCHAR(255) NULL,
  `warehouse_description` LONGTEXT NULL,
  `warehouse_established` DateTime NULL,
  PRIMARY KEY (`warehouse_id`),
  INDEX `warehouse_user_idx` (`warehouse_user` ASC),
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
  `countryrelation_name` VARCHAR(255) NULL,
  `countryrelation_hscode` INT NULL,
  PRIMARY KEY (`countryrelation_id`),
  INDEX `countryrelation_hscode_idx` (`countryrelation_hscode` ASC),
  CONSTRAINT `countryrelation_hscode`
    FOREIGN KEY (`countryrelation_hscode`)
    REFERENCES `custommandb`.`hscode` (`hscode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`invoice` (
  `invoice_id` VARCHAR(255) NOT NULL,
  `invoice_vat` DECIMAL(10,2) NULL,
  `invoice_penalty` DECIMAL(10,2) NULL,
  `invoice_paid` DECIMAL(10,2) NULL,
  PRIMARY KEY (`invoice_id`));

  CREATE TABLE `custommandb`.`billofentry` (
  `billofentry_id` INT NOT NULL AUTO_INCREMENT,
  `billofentry_code` VARCHAR(255) NULL,
  `billofentry_user` INT NULL,
  `billofentry_product` INT NULL,
  `billofentry_origin` VARCHAR(255) NULL,
  `billofentry_invoice` VARCHAR(255) NULL,
  PRIMARY KEY (`billofentry_id`),
  INDEX `billofentry_invoice_idx` (`billofentry_invoice` ASC),
  INDEX `billofentry_product_idx` (`billofentry_product` ASC),
  INDEX `billofentry_user_idx` (`billofentry_user` ASC),
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
  `productlog_warehouse` VARCHAR(255) NULL,
  `productlog_user` INT NULL,
  `productlog_description` VARCHAR(255) NULL,
  `productlog_dateLogged` DATETIME NULL,
  `productlog_image` VARCHAR(255) NULL,
  `productlog_type` INT NULL,
  `productlog_incidentisle` INT NULL,
  PRIMARY KEY (`productlog_id`),
  INDEX `productlog_product_idx` (`productlog_product` ASC),
  INDEX `productlog_type_idx` (`productlog_type` ASC),
  INDEX `productlog_user_idx` (`productlog_user` ASC),
  CONSTRAINT `productlog_type`
    FOREIGN KEY (`productlog_type`)
    REFERENCES `custommandb`.`productlogtype` (`productlogtype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_user`
    FOREIGN KEY (`productlog_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_product`
    FOREIGN KEY (`productlog_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`transferrequest` (
  `transferrequest_id` INT NOT NULL AUTO_INCREMENT,
  `transferrequest_from` VARCHAR(255) NULL,
  `transferrequest_to` VARCHAR(255) NULL,
  `transferrequest_verdict` VARCHAR(255) NULL,
  `transferrequest_user` INT NULL,
  `transferrequest_product` INT NULL,
  `transferrequest_description` VARCHAR(255) NULL,
  `transferrequest_reason` VARCHAR(255) NULL,
  `transferrequestc_requsetDate` DATETIME NULL,
  `transferrequest_approvalDate` DATETIME NULL,
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
  `releaserequest_verdict` VARCHAR(255) NULL,
  `releaserequest_user` INT NULL,
  `releaserequest_product` INT NULL,
  `releaserequest_reason` VARCHAR(255) NULL,
  `releaserequest_requestDate` DATETIME NULL,
  `releaserequest_approvalDate` DATETIME NULL,
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
  INDEX `warehousestock_product_idx` (`warehousestock_product` ASC),
  INDEX `warehousestock_warehouse_idx` (`warehousestock_warehouse` ASC),
  CONSTRAINT `warehousestock_product`
    FOREIGN KEY (`warehousestock_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehousestock_warehouse`
    FOREIGN KEY (`warehousestock_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`transferlist` (
  `transferlist_id` INT NOT NULL AUTO_INCREMENT,
  `transferlist_to` VARCHAR(255) NULL,
  `transferlist_from` VARCHAR(255) NULL,
  `transferlist_product` INT NULL,
  PRIMARY KEY (`transferlist_id`),
  INDEX `transferlist_product_idx` (`transferlist_product` ASC),
  CONSTRAINT `transferlist_product`
    FOREIGN KEY (`transferlist_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_isle` INT NULL,
  `location_row` INT NULL,
  `location_column` INT NULL,
  `location_reserve` INT NULL,
  `location_size` INT NULL,
  `location_product` INT NULL,
  `location_warehouse` INT NULL,
  `location_height` INT NULL,
  `location_width` INT NULL,
  `location_length` INT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `location_product_idx` (`location_product` ASC),
  INDEX `location_warehouse_idx` (`location_warehouse` ASC),
  CONSTRAINT `location_product`
    FOREIGN KEY (`location_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_warehouse`
    FOREIGN KEY (`location_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `message_convoid` INT NULL,
  `message_subject` VARCHAR(255) NULL,
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
  `ownershiprequest_acceptance` VARCHAR(255) NULL,
  `ownershiprequest_product` INT NULL,
  PRIMARY KEY (`ownershiprequest_id`),
  INDEX `ownershiprequest_owner_idx` (`ownershiprequest_owner` ASC),
  INDEX `ownershiprequest_newowner_idx` (`ownershiprequest_newowner` ASC),
  INDEX `ownershiprequest_product_idx` (`ownershiprequest_product` ASC),
  CONSTRAINT `ownershiprequest_owner`
    FOREIGN KEY (`ownershiprequest_owner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ownershiprequest_newowner`
    FOREIGN KEY (`ownershiprequest_newowner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ownershiprequest_product`
    FOREIGN KEY (`ownershiprequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	  CREATE TABLE `custommandb`.`warehouseemployee` (
  `warehouseemployee_id` INT NOT NULL AUTO_INCREMENT,
  `warehouseemployee_employee` INT NULL,
  `warehouseemployee_warehouse` INT NULL,
  PRIMARY KEY (`warehouseemployee_id`),
  INDEX `warehouseemployee_employee_idx` (`warehouseemployee_employee` ASC),
  INDEX `warehouseemployee_warehouse_idx` (`warehouseemployee_warehouse` ASC),
  CONSTRAINT `warehouseemployee_employee`
    FOREIGN KEY (`warehouseemployee_employee`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehouseemployee_warehouse`
    FOREIGN KEY (`warehouseemployee_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


	CREATE TABLE `custommandb`.`warehousetask` (
  `warehousetask_id` INT NOT NULL AUTO_INCREMENT,
  `warehousetask_warehouse` INT NULL,
  `warehousetask_employee` INT NULL,
  `warehousetask_type` VARCHAR(50) NULL,
  `warehousetask_description` LONGTEXT NULL,
  `warehousetask_section` VARCHAR(45) NULL,
  `warehousetask_timestamp` DATETIME NULL,
  `warehousetask_endtime` DATETIME NULL,
  PRIMARY KEY (`warehousetask_id`),
  INDEX `warehousetask_employee_idx` (`warehousetask_employee` ASC),
    INDEX `warehousetask_warehouse_idx` (`warehousetask_warehouse` ASC), 
  CONSTRAINT `warehousetask_employee`
    FOREIGN KEY (`warehousetask_employee`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehousetask_warehouse`
    FOREIGN KEY (`warehousetask_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('1', 'Client');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('2', 'Custom');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('3', 'Warehouse');

INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('1', 'Duty Free');
INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('2', 'Duty');

INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('825', '14');
INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('1', '6');
INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('2', '10');

INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('China','1');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('USA','2');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('Japan','825');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('UK','1');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('Australia','2');

INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('1', 'Ordinary Storage (OS)');
INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('2', 'Special Ordinary Storage (SOS)');

INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('I9');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('TR7');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('RR6');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('T2');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('D3');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('CO2');

INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client@gmail', 'Client', 'client', 'client', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client1@gmail', 'Client1', 'client1', 'client1', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client2@gmail', 'Client2', 'client2', 'client2', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs@gmail', 'Customs', 'customs', 'customs', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs1@gmail', 'Customs1', 'customs1', 'customs1', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse@gmail', 'Warehouse', 'warehouse', 'warehouse', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse1@gmail', 'Warehouse1', 'warehouse1', 'warehouse1', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse2@gmail', 'Warehouse2', 'warehouse2', 'warehouse2', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse3@gmail', 'Warehouse3', 'warehouse3', 'warehouse3', '3');

INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('DS Space', '11 Eva Road, Benoni, 1512', '500', '6', '1','Safe and secure Industrial Park with 24/7 security and visitor controlled access. Central to Midrand, Or Tambo and Pretoria. 3464 sqm warehouse, double volume 380 sqm office with balcony. Stand alone. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2014-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('DHL Express Warehouse', '48 Hoylake Road, Randburg, 2034', '650', '7', '2','Prominent position with excellent exposure onto the M13.This top floor unit offers clear span factory floor in 2 sections with good height and abundant natural light. The unit may divided into 2 x 720m2 units @ R38/m2. Ample office space and staff ablutions. Excellent access to M13/M19/M7. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2010-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('Old Storage', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '800', '8', '1','This well situated mini factory located just off chris hani road and within close proximity to umgeni road and the N2. Offering a total of 320m2, Workshop space has a double volume height ideal for storage, neat office component with kitchenette and 2X staff ablution facilities. Industrial park is fenced and gated with 24 hour security for peace of mind. Contact me for further information. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2000-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('Mount Warehousing', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '1400', '9', '2','Warehouse available in Benoni South. Offering 600sqm with a mezzanine floor. 2 Large roller doors 2 Offices available that has its own entrance. Neat unit. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','1990-01-02 15:05:41');

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
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('D4569', '2', '2', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '3', '3', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '3', '4', 'Korea');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '2', '5', 'Australia');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CD456', '1', '6', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '7', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '2', '8', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '1', '9', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '10', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '2', '11', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '2', '12', 'UK');

INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '2', 'Pending', '1');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '3', 'Pending', '2');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('3', '2', 'Pending', '3');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '5');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '11');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '3', 'Pending', '12');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '8');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '3', 'Pending', '10');


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Delivered : Package was delivered to the warehouse', '2016-08-08 13:40:32', '5');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Transfer Request : A Transfer Request was issued by the owner of the package', '2016-08-08 18:01:25', '2');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Release Request: A release request has been issued by the owner of the package', '2016-08-08 18:05:22', '3');

INSERT INTO `custommandb`.`releaserequest` (`releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`) VALUES ('Pending', '1', '1');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', 'Pending', '1', '1');

UPDATE `custommandb`.`product` SET `product_width`='23', `product_height`='65', `product_length`='78' WHERE `product_id`='1';
UPDATE `custommandb`.`product` SET `product_width`='315', `product_height`='123', `product_length`='138' WHERE `product_id`='2';
UPDATE `custommandb`.`product` SET `product_width`='55', `product_height`='75', `product_length`='155' WHERE `product_id`='3';
UPDATE `custommandb`.`product` SET `product_width`='48', `product_height`='88', `product_length`='185' WHERE `product_id`='4';
UPDATE `custommandb`.`product` SET `product_width`='36', `product_height`='92', `product_length`='135' WHERE `product_id`='5';
UPDATE `custommandb`.`product` SET `product_width`='59', `product_height`='100', `product_length`='160' WHERE `product_id`='6';
UPDATE `custommandb`.`product` SET `product_width`='47', `product_height`='77', `product_length`='85' WHERE `product_id`='7';
UPDATE `custommandb`.`product` SET `product_width`='112', `product_height`='25', `product_length`='64' WHERE `product_id`='8';
UPDATE `custommandb`.`product` SET `product_width`='145', `product_height`='36', `product_length`='35' WHERE `product_id`='9';
UPDATE `custommandb`.`product` SET `product_width`='88', `product_height`='155', `product_length`='45' WHERE `product_id`='10';
UPDATE `custommandb`.`product` SET `product_width`='99', `product_height`='145', `product_length`='75' WHERE `product_id`='12';
UPDATE `custommandb`.`product` SET `product_width`='77', `product_height`='180', `product_length`='45' WHERE `product_id`='11';

UPDATE `custommandb`.`warehouse` SET `warehouse_size`='70' WHERE `warehouse_id`='1';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='60' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='50' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='45' WHERE `warehouse_id`='4';

UPDATE `custommandb`.`warehouse` SET `warehouse_size`='70' WHERE `warehouse_id`='1';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='60' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='50' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='45' WHERE `warehouse_id`='4';


UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='6';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='7';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='8';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='12';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='13';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='14';


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'DHL Express Warehouse', '3', 'Incident : Water Damage', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'DHL Express Warehouse', '3', 'Incident : Fire Damage', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'DHL Express Warehouse', '3', 'Incident : Wild Dog Tore The Package', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'Old Storage', '3', 'Incident : Rat Attacks', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'Old Storage', '3', 'Incident : Bowling Ball Now Has Four Holes', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'Mount Warehousing', '3', 'Incident : I am running out of things to say', '2016-08-03 11:14:02', '1');



INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`) VALUES ('1', 'payment', '1', '2', 'when will you make payment');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`) VALUES ('1', 'payment', '2', '1', 'i already paid');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('2', 'xbox', '3', '4', 'still interested in the xbox', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('2', 'xbox', '4', '3', 'yes definitely, how much are you looking for it', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('3', 'incident on golf clubs', '5', '6', 'I will just like you to know that I expect a full reinbursement for my golf sticks', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('3', 'incident on golf clubs', '6', '5', 'we are atually purhasing a new set for you rest assuredx', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('4', 'ciro', '7', '8', 'i love this service x', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('4', 'ciro', '8', '7', 'we are glad to hear that', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('5', 'package release', '7', '8', 'when will my package be released', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('5', 'package release', '8', '7', 'its available for collection afeter release has been accepeted', '2016-08-03 11:14:02');

INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('1', '260.00', '122.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('2', '360.00', '40.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('3', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('4', '120.00', '4.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('5', '420.00', '678.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('6', '70.00', '123.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('7', '470.00', '220.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('8', '670.00', '1260.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('9', '80.00', '320.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('10', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('11', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('12', '2600.00', '370.00', '0.00');

UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='1' WHERE `billofentry_id`='1';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='2' WHERE `billofentry_id`='2';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='3' WHERE `billofentry_id`='3';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='4' WHERE `billofentry_id`='4';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='5' WHERE `billofentry_id`='5';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='6' WHERE `billofentry_id`='6';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='7' WHERE `billofentry_id`='7';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='8' WHERE `billofentry_id`='8';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='9' WHERE `billofentry_id`='9';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='10' WHERE `billofentry_id`='10';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='11' WHERE `billofentry_id`='11';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='12' WHERE `billofentry_id`='12';


UPDATE `custommandb`.`warehouse` SET `warehouse_isles`='7' WHERE `warehouse_id`='1';
UPDATE `custommandb`.`warehouse` SET `warehouse_isles`='8' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_isles`='6' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_isles`='8' WHERE `warehouse_id`='4';


UPDATE `custommandb`.`countryrelation` SET `countryrelation_name`='United States of America' WHERE `countryrelation_id`='2';
UPDATE `custommandb`.`countryrelation` SET `countryrelation_name`='England' WHERE `countryrelation_id`='4';
UPDATE `custommandb`.`countryrelation` SET `countryrelation_name`='Saudi Arabia' WHERE `countryrelation_id`='4';

UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='United States of America' WHERE `billofentry_id`='2';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='United States of America' WHERE `billofentry_id`='7';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='United States of America' WHERE `billofentry_id`='8';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='United States of America' WHERE `billofentry_id`='11';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='Saudi Arabia' WHERE `billofentry_id`='12';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='Saudi Arabia' WHERE `billofentry_id`='6';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='Saudi Arabia' WHERE `billofentry_id`='3';
UPDATE `custommandb`.`billofentry` SET `billofentry_origin`='Japan' WHERE `billofentry_id`='4';

INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('R');