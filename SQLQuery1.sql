if exists (select 1
            from  sys.procedures
            where  name ='FABRIQUELOGIN'
           )
drop procedure dbo.FABRIQUELOGIN
go


create procedure FABRIQUELOGIN

@nom varchar(28),
@prenom varchar(25),
@logincalcule varchar(28) out

as

declare 

@compteur as int = 0,
@nombre_aleatoire as varchar(4)

begin

set @nombre_aleatoire =  substring ( cast(floor ((9000*rand())+1000)as varchar(50)) , 1 , 4 );

	while @compteur < 5

			begin		
			set @nom = @nom + substring(@prenom, @compteur, 1);
			set @compteur = @compteur + 1;
			end
			
	set @logincalcule = @nom + @nombre_aleatoire	

end
go


declare @logincalcule varchar(28)
execute dbo.FABRIQUELOGIN 'FAURE', 'LAURENT', @logincalcule out
print @logincalcule
go

