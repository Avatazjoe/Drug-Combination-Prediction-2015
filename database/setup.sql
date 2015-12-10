drop database if exists dream;
create database dream;
use dream;

create table drug_name
(
  id int primary key not null auto_increment,
  name varchar(10) not null
)
engine = InnoDB;

create table cell_name
(
  id int primary key not null auto_increment,
  name varchar(10) not null
)
engine = InnoDB;

create table drug_feature
(
  id int primary key not null auto_increment,
  feature varchar(10) not null
)
engine = InnoDB;

create table cell_feature
(
  id int primary key not null auto_increment,
  feature varchar(10) not null
)
engine = InnoDB;

create table drug_drug_feature
(
  id int primary key not null auto_increment,
  feature varchar(10) not null
)
engine = InnoDB;

create table drug_cell_feature
(
  id int primary key not null auto_increment,
  feature varchar(10) not null
) engine = InnoDB;

create table drug_drug_cell_feature
(
  id int primary key not null auto_increment,
  feature varchar(10) not null
)
engine = InnoDB;

create table drug
(
  id int primary key not null auto_increment,
  drug_id int not null,
  feature_id int not null,
  value varchar(10),
   
  foreign key (drug_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (feature_id)
  references drug_feature (id)
  on delete no action
  on update no action
) engine = InnoDB;

create table cell 
(
  id int primary key not null auto_increment,
  cell_id int not null,
  feature_id int not null,
  value varchar(10),
   
  foreign key (cell_id)
  references cell_name (id)
  on delete no action
  on update no action,

  foreign key (feature_id)
  references cell_feature (id)
  on delete no action
  on update no action
) engine = InnoDB;

create table drug_drug
(
  id int primary key not null auto_increment,
  drugA_id int not null,
  drugB_id int not null,
  feature_id int not null,
  value varchar(10),
   
  foreign key (drugA_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (drugB_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (feature_id)
  references drug_drug_feature (id)
  on delete no action
  on update no action
) engine = InnoDB;

create table drug_cell
(
  id int primary key not null auto_increment,
  drug_id int not null,
  cell_id int not null,
  feature_id int not null,
  value varchar(10),
   
  foreign key (drug_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (cell_id)
  references cell_name (id)
  on delete no action
  on update no action,

  foreign key (feature_id)
  references drug_cell_feature (id)
  on delete no action
  on update no action
) engine = InnoDB;

create table drug_drug_cell
(
  id int primary key not null auto_increment,
  drugA_id int not null,
  drugB_id int not null,
  cell_id int not null,
  feature_id int not null,
  value varchar(10) not null,
   
  foreign key (drugA_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (drugB_id)
  references drug_name (id)
  on delete no action
  on update no action,

  foreign key (cell_id)
  references cell_name (id)
  on delete no action
  on update no action,

  foreign key (feature_id)
  references drug_drug_cell_feature (id)
  on delete no action
  on update no action
) engine = InnoDB;

create table drug_synergy_data (
	id int not null auto_increment primary key,
	src varchar(30) not null,
	cell_line varchar(30) not null,
	compound_a varchar(30) not null,
	compound_b varchar(30) not null,
	max_conc_a decimal(5,2) not null, # precision 5, scale 2 (i.e. xxx.xx)
	max_conc_b decimal(5,2) not null,
	ic50_a decimal(50,25) not null,
	ic50_b decimal(50,25) not null,
	h_a decimal(50,25) not null,
	h_b decimal(50,25) not null,
	e_inf_a decimal(50,2) not null,
	e_inf_b decimal(50,25) not null,
	synergy_score varchar(10) not null,
	qa int not null,
	combination_id varchar(30) not null
);

