
Sys.time()
as.Date('1915-6-16')
as.Date('1990/02/17')

as.Date('1/15/2001',format='%m/%d/%Y')

as.Date(Sys.time(),format='%m/%d/%Y')
as.Date(Sys.Date(),format='%m/%d/%Y')

as.Date('22JUN01',format='%d%b%y')
mydate = as.POSIXlt('2005-4-19 7:01:00')
names(mydate)

d1 = ISOdate(1977,7,13)
d2 = ISOdate(2003,8,14)
d1 -d2
d2-d1
difftime(d1,d2,units='weeks')
difftime(d2,d1,units='weeks')
