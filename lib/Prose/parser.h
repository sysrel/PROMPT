/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_HOME_TUBA_DOCUMENTS_RELEASES_PROMPT_LIB_PROSE_PARSER_H_INCLUDED
# define YY_YY_HOME_TUBA_DOCUMENTS_RELEASES_PROMPT_LIB_PROSE_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ALLOC = 258,
    ARG = 259,
    ARGS = 260,
    ARGSIZE = 261,
    ARRAY = 262,
    ASM = 263,
    BOUND = 264,
    BY = 265,
    CONTINUE = 266,
    CONSTANT = 267,
    DATA = 268,
    EMBEDS = 269,
    ENTRYPOINT = 270,
    EXCEPT = 271,
    FALSEVAL = 272,
    FIELD = 273,
    FREE = 274,
    FUNCPTRS = 275,
    FUNCS = 276,
    FUNCTION = 277,
    GLOBAL = 278,
    HAVOC = 279,
    HAVOCING = 280,
    IF = 281,
    IS = 282,
    INIT = 283,
    INITZERO = 284,
    INLINE = 285,
    INTEGER = 286,
    LIFECYCLE = 287,
    LOOP = 288,
    MEMARG = 289,
    MEMRETURN = 290,
    MODEL = 291,
    MODELS = 292,
    MODELED = 293,
    NULL_TOKEN = 294,
    OF = 295,
    OFF = 296,
    ON = 297,
    PATTERN = 298,
    LTS = 299,
    LEQS = 300,
    GTS = 301,
    GEQS = 302,
    EQS = 303,
    NOTS = 304,
    NEQS = 305,
    PLUSS = 306,
    MINUSS = 307,
    TIMESS = 308,
    RETURN = 309,
    RETURNONLY = 310,
    RETURNOF = 311,
    SETTINGS = 312,
    SINGLETON = 313,
    SINGLETONS = 314,
    SIZE = 315,
    SIZEARG = 316,
    SIZEOF = 317,
    SKIP = 318,
    SYMBOLIZE = 319,
    TO = 320,
    TRUEVAL = 321,
    TYPE = 322,
    VALUE = 323,
    WHERE = 324,
    WITH = 325,
    L_IDENT = 326
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 123 "Prose.y" /* yacc.c:1909  */

	bool y_bool;
	int y_int;
	klee::Sequential *y_sequential;
	klee::Identifier *y_id;
        std::vector<klee::Identifier*> *y_id_list;
	ASTNode *y_ast;
	BoundAST *y_bound;
	std::map<std::string, Binding> *y_bind_map;
	std::pair<std::string, Binding> *y_bind_pair;
        std::set<std::string> *y_exception_set;
        std::set<unsigned> *y_number_list;
	Binding *y_bind;
	char *y_ident;
        Op op;

#line 143 "/home/tuba/Documents/releases/PROMPT/lib/Prose/parser.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_HOME_TUBA_DOCUMENTS_RELEASES_PROMPT_LIB_PROSE_PARSER_H_INCLUDED  */
