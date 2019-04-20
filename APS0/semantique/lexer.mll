{
 open Parser
 exception Eof
}

rule token = parse
	[' ' '\t' '\n'] { token lexbuf}
	| ['0'-'9']+('.'['0'-'9'])? as lxm { NUM(int_of_string lxm) }
	| "add"            { PLUS }
	| "sub"            { MINUS }
	| "mul"            { TIMES }
	| "div"            { DIV }
	| "eq"		   { EQ }
	| "lt" 		   { LT }
	| '('              { LPAR }
	| ')'              { RPAR }
	| '['              { LCRO}
	| ']'              { RCRO}
	| ';'              {SEPARATOR}
	| "->"		   {FLECHE}
	| '*'	           {ETOILE}
	| ':'		   {DPOINTS}
	| "CONST"          {CONST}
	| "FUN"            {FUN}             							
	| "REC"            {REC}
	| "ECHO"           {ECHO}
	| ","		   {VIRGU}
	| "int"		   {INT}
	| "bool"  	   {BOOL}
	| "if"  	   {IF}
	| (['a'-'z' 'A'-'Z'])(['a'-'z' 'A'-'Z' '0'-'9'])* as lxm {IDENT lxm }
	| eof              { raise Eof }
