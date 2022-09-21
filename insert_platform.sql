use versus;

alter table platform
modify column price decimal(10,10);

insert into platform
	values(1,'netflix',14.99);

insert into platform
	values(2,'amazon prime',9.99);

insert into platform
	values(3,'disney',9.99);

insert into platform
	value(4,'hbo max',14.99);

insert into platform
	values(5,'canal +',29.99);
