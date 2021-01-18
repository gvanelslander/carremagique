program Carre_magique;

uses crt;

CONST
	TAILLE = 5;

Type tableau = array[1..TAILLE,1..TAILLE] of integer;

procedure init_tab(tab : tableau);

VAR
x, y : integer;

Begin
	for y := 1 to TAILLE do
	begin
		for x := 1 to TAILLE do
		begin
			tab[x,y] := 0;
		end;
	end;
end;

function nbr_chiffre(VAR l: integer):integer;

VAR
 long, nbr :integer;

begin
 	long := 1;
 	nbr := 1;
 	while nbr > 9 do
 	begin
 		long := long + 1;
 		nbr := nbr DIV 10;
 	end;
 	nbr_chiffre := long;
end;


VAR
	tablo : array[1..TAILLE,1..TAILLE] of integer;
	x, y, i, long, long_max : integer;

BEGIN

		clrscr;
		init_tab(tablo);
		long_max := 1;
		long := 1;
		x := TAILLE DIV 2 + 1;
		y := TAILLE DIV 2;

		for i := 1 to (TAILLE * TAILLE) do
		begin
			tablo[x,y] := i;
			x := (x + 1);
			if x > TAILLE then
			begin
				x := 1;
			end;
			y := (y - 1);
			if y < 1 then
			begin
				y := TAILLE;
			end;
			if tablo [x,y] > 0 then
			begin
				x := (x - 1);
				if x < 1 then
				begin
					x := TAILLE;
				end;
				y := (y - 1);
				if y < 1 then
				begin
					y := TAILLE;
				end;
			end;
		end;
		long_max := nbr_chiffre(i);

		for x := 1 to (TAILLE * (long_max + 1) + 1) do
		begin
			write ('__');
		end;
		writeln;
		for y := 1 to TAILLE do
		begin
			write ('|');
			for x := 1 to TAILLE do
			begin
				long := nbr_chiffre(tablo[x,y]);
				for i := 1 to (long_max - long) do
				begin
					write (' ');
				end;
				write (tablo[x,y],'|');
			end;
			writeln;
			write ('|');
			for x := 1 to TAILLE do
			begin
				for i := 1 to long_max do
				begin
					write ('__');
				end;
				write('|');
			end;
			writeln;
		end;
		readln;
END.
