create table roles(
    id int auto_increment NOT NULL UNIQUE,
    name varchar(255) NOT NULL UNIQUE,
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    PRIMARY KEY (id)
);

create table users (
	id int auto_increment NOT NULL UNIQUE,
    username varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    token varchar(255),
    email varchar(255),
    fullname varchar(255) NOT NULL,
    phone_number varchar(255),
    skype varchar(255),
    roles_id int,
    FOREIGN KEY (roles_id) REFERENCES roles(id),
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    PRIMARY KEY (id)
);

create table university (
	id int auto_increment NOT NULL UNIQUE,
    name varchar(255) NOT NULL,
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    PRIMARY KEY (id)
);

create table company_card (
	id varchar(255) NOT NULL UNIQUE,
    using_flg boolean default true,
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    PRIMARY KEY (id)
);

create table mentor (
	id int auto_increment NOT NULL UNIQUE,
	user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    max_internship int,
    is_active_flg boolean default true,
    primary key (id)
);

create table positions (
	id int auto_increment NOT NULL UNIQUE,
    name varchar(255),
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    primary key (id)
);

create table intern (
	id int auto_increment NOT NULL UNIQUE,
	user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
	birthday date,
    university_id int,
    FOREIGN KEY (university_id) REFERENCES university(id),
    scholastic int,
    indentify_card varchar(255),
    mentor_id int,
    FOREIGN KEY (mentor_id) REFERENCES mentor(id),
    company_card_id varchar(255),
    FOREIGN KEY (company_card_id) REFERENCES company_card(id),
    position_id int,
    FOREIGN KEY (position_id) REFERENCES positions(id),
    intern_status int,
    intern_level int,
    memo varchar(255),
    primary key (id)
);

create table internship_time_sheet (
	id int auto_increment NOT NULL UNIQUE,
    intern_id int,
    FOREIGN KEY (intern_id) REFERENCES intern(id),
    working_day datetime,
    time varchar(255),
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    primary key (id)
);

create table mentor_internship (
	id int auto_increment NOT NULL UNIQUE,
    intern_id int,
    FOREIGN KEY (intern_id) REFERENCES intern(id),
    mentor_id int,
    FOREIGN KEY (mentor_id) REFERENCES mentor(id),
    position_id int,
    FOREIGN KEY (position_id) REFERENCES positions(id),
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    primary key (id)
);

create table reviews (
	id int auto_increment NOT NULL UNIQUE,
    type int NOT NULL,
    reviewer_id int,
    FOREIGN KEY (reviewer_id) REFERENCES mentor(id),
    object_id int,
    ranks varchar(255),
    content varchar(255),
    is_del_flg boolean default false,
    created_id int,
    created_at timestamp,
    modified_id int,
    modified_at timestamp,
    primary key (id)
);
