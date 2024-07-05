--Declaracion de y uso de variables en transct-sql

--Declaracion de una variable 
declare @numeroCal int
declare @calif decimal (10,2)

--Asignacion de varible 
set @numeroCal = 10 
if @numeroCal<=0 
begin 
set @numeroCal = 1
end
declare @i= 1
while(@i<=@numeroCal)
begin 
set @calif = @calif + 10 
set @i = @i+1
end
@calif = @calif/@numeroCal
print ('El resultado es = ' @calif)

