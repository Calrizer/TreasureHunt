program treasure;

uses crt;

var pos,found : array[1..10, 1..10] of char;
guess : string;
current, x, y : integer;

function getX : integer;
begin
	if (guess[1] = 'A') xor (guess[1] = 'a') then
	begin	
		getX := 1;
		x := 10;
	end
	else if (guess[1] = 'B') xor (guess[1] = 'b') then
	begin	
		getX := 2;
		x := 14;
	end
	else if (guess[1] = 'C') xor (guess[1] = 'c') then
	begin	
		getX := 3;
		x := 18;
	end
	else if (guess[1] = 'D') xor (guess[1] = 'd') then
	begin	
		getX := 4;
		x := 22;
	end
	else if (guess[1] = 'E') xor (guess[1] = 'e') then
	begin	
		getX := 5;
		x := 26;
	end
	else if (guess[1] = 'F') xor (guess[1] = 'f') then
	begin	
		getX := 6;
		x := 30;
	end
	else if (guess[1] = 'G') xor (guess[1] = 'g') then
	begin	
		getX := 7;
		x := 34;
	end
	else if (guess[1] = 'H') xor (guess[1] = 'h') then
	begin	
		getX := 8;
		x := 38;
	end
	else if (guess[1] = 'I') xor (guess[1] = 'i') then
	begin	
		getX := 9;
		x := 42;
	end
	else if (guess[1] = 'J') xor (guess[1] = 'j') then
	begin	
		getX := 10;
		x := 46;
	end
	else getX := 0;
end;

function getY : integer;
begin
	if (guess[2] = '1') and (Length(guess) = 2) then
	begin	
		getY := 1;
		y := 4;
	end
	else if guess[2] = '2' then
	begin
		getY := 2;
		y := 6;
	end
	else if guess[2] = '3' then
	begin
		getY := 3;
		y := 8;
	end
	else if guess[2] = '4' then
	begin
		getY := 4;
		y := 10;
	end
	else if guess[2] = '5' then
	begin
		getY := 5;
		y := 12;
	end
	else if guess[2] = '6' then
	begin
		getY := 6;
		y := 14;
	end
	else if guess[2] = '7' then
	begin
		getY := 7;
		y := 16;
	end
	else if guess[2] = '8' then
	begin
		getY := 8;
		y := 18;
	end
	else if guess[2] = '9' then
	begin
		getY := 9;
		y := 20;
	end
	else if (guess[2] = '1') and (guess[3] = '0') then
	begin
		getY := 10;
		y := 22;
	end
	else getY := 0;
end;

procedure generateTreasure;
begin
	for current := 1 to 5 do
	begin
		x := Random(10) + 1;
		y := Random(10) + 1;
		if pos[x,y] <> 'X' then pos[x,y] := 'X'
		else current := current - 1;
	end;
end;

procedure getPos;
begin
	
	current := 0;
	
	repeat
		GotoXY(70,14);
		readln(guess);
		GoToXY(70,14);
		ClrEol;
		GotoXY(66, 16);
		ClrEol;
		GoToXY(74,16);
		write(chr(186));
		if (pos[getX,getY] = 'X') and (found[getX,getY] <> 'X')then
		begin
			GoToXY(x,y);
			write('X');
			current := current + 1;
			GotoXY(66, 16);
			write('Found!');
			found[getX,getY] := 'X';
		end
		else if (pos[getX - 1, getY - 1] = 'X') or (pos[getX + 1, getY + 1] = 'X') or (pos[getX + 1, getY - 1] = 'X') 
		or (pos[getX - 1, getY + 1] = 'X') or (pos[getX, getY + 1] = 'X') or (pos[getX, getY - 1] = 'X') 
		or (pos[getX + 1, getY] = 'X') or (pos[getX - 1, getY] = 'X') then
		begin	
			GoToXY(x,y);
			TextColor(Red);
			write('?');
			GotoXY(66, 16);
			write('Warm!');
			TextColor(White);
		end
		else
		begin
			if found[getX,getY] <> 'X' then
			begin
				GoToXY(x,y);
				write('?');
				GotoXY(66, 16);
				write('Cold!');
			end;
		end;
		GoToXY(70,14);
		ClrEol;
		GoToXY(74,14);
		write(chr(186));
		GoToXY(70,14);
	until current = 5
end;

procedure writeBoard;
begin
	writeln;
        writeln('         A   B   C   D   E   F   G   H   I   J');
        writeln('       ษอออหอออหอออหอออหอออหอออหอออหอออหอออหอออป');
        writeln('     1 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน');
        writeln('     2 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน       ษอออออออออออออออออป');
        writeln('     3 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ       บ  Treasure Hunt  บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน       ศอออออออออออออออออผ');
        writeln('     4 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน');
        writeln('     5 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน       ษอออออออออออออออออป');
        writeln('     6 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ       บ Coordinate:     บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน       บ                 บ');
        writeln('     7 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ       บ Result:         บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน       ศอออออออออออออออออผ');
        writeln('     8 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน');
        writeln('     9 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ฬอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออฮอออน');
        writeln('    10 บ   บ   บ   บ   บ   บ   บ   บ   บ   บ   บ');
        writeln('       ศอออสอออสอออสอออสอออสอออสอออสอออสอออสอออผ');
end;

procedure clearBoard;
begin
	for current := 1 to 50 do
	begin
		GoToXY(1, current);
		ClrEol;
		Delay(40);
	end;
end;

begin
     Randomize;
	 TextColor(White);
	 clrscr;
     writeBoard;
     generateTreasure;
     getPos;
	 clearBoard;
	 GoToXY(16,10);
	 write('Congratulations, you found all the treasure!');
	 GoToXY(26,15);
	 write('Press ENTER to exit.');
     readln;
end.