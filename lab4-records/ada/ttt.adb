with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;


procedure TTT is

    type Player is
        (Player_X, Player_O); -- Ada enumerated type

    -- use default formatting and parsing of Player values
    package Player_IO is
        new Ada.Text_IO.Enumeration_IO(Player);
    use Player_IO;

    type CellValue is
        (X, O, B);

    -- function to help formatting CellValues
    function CellSymbol(cell : CellValue) return String
    is begin
        case cell is
            when X => return "X";
            when O => return "O";
            when B => return ".";
        end case;
    end CellSymbol;

    type TTTRow is
        array (1..3) of CellValue;
    type TTTBoard is
        array (1..3) of TTTRow;

    -- display a board to the terminal
    procedure Put_Board(board : TTTBoard) is
        procedure Put_Row(row : TTTRow) is
        begin
            for I in 1..3 loop
                Put(CellSymbol(row(I)));
            end loop;
            Put_Line("");
        end Put_Row;
    begin
        for I in 1..3 loop
            Put_Row(board(I));
        end loop;
    end Put_Board;

    -- start of code to focus on in Practical 4
    type game_state is
	(COMPLETE, IN_PROGRESS);

    type variant is
        (WON, LOST);

    type GamePos (state : game_state:= IN_PROGRESS) is
        record
            board : TTTBoard;
	    case state is
		when IN_PROGRESS =>
                    turn : Player;
                    value : Float;
	        when COMPLETE =>
		    pos_variant : variant;
	            winner : Player;
	    end case;
        end record;

    procedure Put_Pos(pos : GamePos) is
    begin
        Put_Board(pos.board);
	New_Line;

	case Pos.State is
	    when IN_PROGRESS =>
        	Put("Player to make the next move: ");
        	Put(pos.turn);
        	Put_Line("");
        	Put("Estimated advantage of player X over player O is: ");
        	Put(pos.value, 0, 0, 0);
        	Put_Line("");
	    when COMPLETE =>
		Put("The Winner is: ");
		Put(pos.winner);
		New_Line;
	end case;	
    end Put_Pos;

    gamePos1 : GamePos
        := (state => IN_PROGRESS,board =>
                ((X, X, O),
                 (O, B, X),
                 (O, B, B)),
            turn => Player_X,
            value => 0.0);

    gamePos2 : GamePos
        := (state => COMPLETE,pos_variant => WON, -- the discriminant
             board =>
                 ((X, X, O),
                 (O, X, X),
                 (O, O, X)),
            winner => Player_X);

begin
    Put_Pos(gamePos1);
    Put_Line("");
    Put_Pos(gamePos2);
end TTT;
