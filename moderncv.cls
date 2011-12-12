%% start of file `moderncv.cls'.
%% Copyright 2006-2011 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.


%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moderncv}[2011/12/04 v0.14 modern curriculum vitae document class]


%-------------------------------------------------------------------------------
%                debugging
%-------------------------------------------------------------------------------
\newif\if@DEBUG\@DEBUGfalse


%-------------------------------------------------------------------------------
%                class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% paper size option
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}{
  \setlength\paperheight{210mm}
  \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}
  \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}{
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}{
  \setlength\paperheight{14in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper}{
  \setlength\paperheight{10.5in}
  \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}{
  \setlength\@tempdima{\paperheight}
  \setlength\paperheight{\paperwidth}
  \setlength\paperwidth{\@tempdima}}

% font size options
\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% font type options
\DeclareOption{sans}{\renewcommand{\familydefault}{\sfdefault}}
\DeclareOption{roman}{\renewcommand{\familydefault}{\rmdefault}}

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% execute default options
\ExecuteOptions{a4paper,11pt,sans,final}

% process given options
\ProcessOptions\relax
\input{size1\@ptsize.clo}


%-------------------------------------------------------------------------------
%                required packages
%-------------------------------------------------------------------------------
% \AtEndPreamble hook (loading tetoolbox instead of defining the macro, as to avoid incompatibilities with etoolbox (and packages relying on it) defining the macro too)
\RequirePackage{etoolbox}
%\let\@endpreamblehook\@empty
%\def\AtEndPreamble{\g@addto@macro\@endpreamblehook}
%\let\moderncv@document\document
%\def\document{\endgroup\@endpreamblehook\begingroup\moderncv@document}

% if... then... else... constructs
\RequirePackage{ifthen}

% color
\RequirePackage{xcolor}

% automatic loading of latin modern fonts if present on the system
\IfFileExists{lmodern.sty}
  {\RequirePackage[T1]{fontenc}\RequirePackage{lmodern}}
  {}

% symbols like \Telefon, \Mobilefone, \Letter and \Email
\RequirePackage{marvosym}

% hyper links
\RequirePackage{url}
\urlstyle{tt}
% load hyperred at the end of the preamble to pass options required by loaded packages (like CJK)
\AtEndPreamble{
  \@ifpackageloaded{CJK}
    {\RequirePackage[unicode]{hyperref}}
    {\RequirePackage{hyperref}}
    \hypersetup{
      breaklinks,
      baseurl       = http://,
      pdfborder     = 0 0 0,
      pdfpagemode   = UseNone,% do not show thumbnails or bookmarks on opening
      pdfpagelabels = false,% to avoid a warning setting it automatically to false anyway, because hyperref detects \thepage as undefined (why?)
      pdfstartpage  = 1,
      pdfcreator    = \LaTeX{} with `moderncv' package,
      pdfproducer   = \LaTeX{},
      bookmarksopen = true,
      pdfauthor     = \@firstname~\@familyname,
      pdftitle      = \@title,
      pdfsubject    = \@firstname~\@familyname,
      pdfkeywords   = \@firstname~\@familyname{} curriculum vit\ae{}}
  \pagenumbering{arabic}% has to be issued after loading hyperref
}

% graphics
\RequirePackage{graphicx}

% headers and footers
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}}
\pagestyle{plain}

% lengths calculations
\RequirePackage{calc}

% advanced command arguments
\RequirePackage{xargs}

% compatibility package with older versions of moderncv
\RequirePackageWithOptions{moderncvcompatibility}


%-------------------------------------------------------------------------------
%                class definition
%-------------------------------------------------------------------------------
% minimal base settings
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0\p@}
\setlength{\parskip}{0\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

% Not required
%\setlength\arraycolsep{5\p@}
%\setlength\tabcolsep{6\p@}
%\setlength\arrayrulewidth{.4\p@}
%\setlength\doublerulesep{2\p@}
%\setlength\tabbingsep{\labelsep}

\pagestyle{empty}
\raggedbottom
\onecolumn


%-------------------------------------------------------------------------------
%                design commands definitions
%-------------------------------------------------------------------------------
% symbols
%   itemize labels
\newcommand*{\labelitemi}{\textcolor{color1}{\Neutral}}% alternative" \fontencoding{U}\fontfamily{ding}\selectfont\tiny\symbol{'102}
\newcommand*{\labelitemii}{\textcolor{color1}{\large\bfseries-}}
\newcommand*{\labelitemiii}{\textcolor{color1}{\textperiodcentered}}% alternative: \textasteriskcentered; both force the use of the CMSY font, even when lmodern fonts are used :(
\newcommand*{\labelitemiv}{\textcolor{color1}{\textperiodcentered}}
%   enumerate labels
\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
%   other symbols
\newcommand*{\listitemsymbol}{\labelitemi}
\newcommand*{\addresssymbol}{}
\newcommand*{\mobilesymbol}{\Mobilefone}
\newcommand*{\phonesymbol}{\Telefon}
\newcommand*{\faxsymbol}{\FAX}
\newcommand*{\emailsymbol}{\Letter}
\newcommand*{\homepagesymbol}{{\Large\ComputerMouse}}

% colors
\definecolor{color0}{rgb}{0,0,0}% main default color, normally left to black
\definecolor{color1}{rgb}{0,0,0}% primary theme color
\definecolor{color2}{rgb}{0,0,0}% secondary theme color
\definecolor{color3}{rgb}{0,0,0}% tertiary theme color

% fonts
\newcommand*{\namefont}{}
\newcommand*{\titlefont}{}
\newcommand*{\addressfont}{}
\newcommand*{\quotefont}{}
\newcommand*{\sectionfont}{}
\newcommand*{\subsectionfont}{}
\newcommand*{\hintfont}{}
\AtBeginDocument{\normalfont\color{color0}}

% loads a style scheme
\newcommand*{\moderncvstyle}[1]{
  \RequirePackage{moderncvstyle#1}}
  
% loads a color scheme
\newcommand*{\moderncvcolor}[1]{
  \RequirePackage{moderncvcolor#1}}

% recompute all automatic lengths
\newcommand*{\recomputelengths}{}
\AtBeginDocument{\recomputelengths{}}


%-------------------------------------------------------------------------------
%                structure commands definitions
%-------------------------------------------------------------------------------
% cv elements
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\renewcommand*{\title}[1]{\def\@title{#1}}
\newcommand*{\address}[2]{\def\@addressstreet{#1}\def\@addresscity{#2}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\renewcommand*{\fax}[1]{\def\@fax{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\newcommandx*{\photo}[3][1=64pt,2=0.4pt,usedefault]{\def\@photowidth{#1}\def\@photoframewidth{#2}\def\@photo{#3}}% the 1st (optional) argument is the width of the photo, the 2nd (optional) argument is the thickness of the frame around it.
\newcommand*{\quote}[1]{\def\@quote{#1}}

% makes the cv title
% usage: \maketitle
\newcommand*{\maketitle}{}%
\title{}% to avoid LaTeX complaining that \maketitle is a called without first a call to \title

% makes the cv footer
% usage: \makefooter
\newcommand*{\makefooter}

% makes a cv section
% usage: \section{<title>}
\newcommand*{\section}[1]{}
\AtEndPreamble{%
  \@ifpackageloaded{natbib}
    {
      \RequirePackage{suffix}
      \WithSuffix\newcommand\section*{\section}
    }{}
}

% makes a cv subsection
% usage: \subsection{title}
\newcommand*{\subsection}[1]{}

% makes a cv line with a header and a corresponding text
% usage: \cvitem[spacing]{header}{text}
\newcommand*{\cvitem}[3][.25em]{}

% makes a cv line 2 headers and their corresponding text
% usage: \cvdoubleitem[spacing]{header1}{text1}{header2}{text2}
\newcommand*{\cvdoubleitem}[5][.25em]{}

% makes a cv line with a list item
% usage: \cvlistitem[label]{item}
\newcommand*{\cvlistitem}[2][\listitemsymbol{}]{}

% makes a cv line with 2 list items
% usage: \cvlistdoubleitem[label]{item1}{item2}
\newcommand*{\cvlistdoubleitem}[3][\listitemsymbol{}]{}

% makes a typical cv job / education entry
% usage: \cventry{years}{degree/job title}{institution/employer}{localization}{optionnal: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[6]{}

% makes a cv entry with a proficiency comment
% usage: \cvitemwithcomment{header}{text}{comment}
\newcommand*{\cvitemwithcomment}[3]{}

% makes a generic hyperlink
% usage: \link[optional text]{link}
\newcommand*{\link}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{#2}{#2}}%
    {\href{#2}{#1}}}

% makes a http hyperlink
% usage: \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{http://#2}{#2}}%
    {\href{http://#2}{#1}}}

% makes an email hyperlink
% usage: \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{mailto:#2}{#2}}%
    {\href{mailto:#2}{#1}}}

% page numbers in footer if more than 1 page
\newif\if@displaypagenumbers\@displaypagenumberstrue
\newcommand*{\nopagenumbers}{\@displaypagenumbersfalse}
\AtEndPreamble{%
  \AtBeginDocument{%
    \if@displaypagenumbers%
      \@ifundefined{r@lastpage}{}{%
        \ifthenelse{\pageref{lastpage} > 1}{%
          \fancypagestyle{plain}{%
            \fancyfoot[r]{\addressfont\color{color2}\footnotesize\thepage/\pageref{lastpage}}}%
          \pagestyle{plain}}{}}%
      \AtEndDocument{\label{lastpage}}\else\fi}}

% thebibliography environment, for use with BibTeX and possibly multibib
\newcommand{\refname}{Publications}
\newlength{\bibindent}
\setlength{\bibindent}{1.5em}
% bibliography item label
\newcommand*{\bibliographyitemlabel}{}% use \@biblabel{\arabic{enumiv}} for BibTeX labels
%\newif\if@multibibfirstbib\@multibibfirstbibfalse
% bibliography head (section, etc}, depending on whether multibib is used
\newcommand*{\bibliographyhead}[1]{\section{#1}}
\AtEndPreamble{\@ifpackageloaded{multibib}{\renewcommand*{\bibliographyhead}[1]{\subsection{#1}}}{}}
% thebibliography environment definition
\newenvironment{thebibliography}[1]{}{}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

% itemize, enumerate and description environment
\setlength{\leftmargini}   {1em}
\leftmargin\leftmargini
\setlength{\leftmarginii}  {\leftmargini}
\setlength{\leftmarginiii} {\leftmargini}
\setlength{\leftmarginiv}  {\leftmargini}
\setlength{\leftmarginv}   {\leftmargini}
\setlength{\leftmarginvi}  {\leftmargini}
\setlength{\labelsep}      {.5em}% this is the distance between the label and the body, but it pushes the label to the left rather than pushing the body to the right (to do the latter, modify \leftmargin(i)
\setlength{\labelwidth}    {\leftmargini}% unfortunately, \labelwidth is not defined by item level (i.e. no \labeliwidth, \labeliiwidth, etc)
\addtolength{\labelwidth}  {-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\p@enumii(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
% description label
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries#1}
% hooks to adjust spacing (idea by Jakob Schiotz; see http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/tweaklist.sty)
\RequirePackage{tweaklist}% distributed with moderncv, not found on ctan and slightly modified
\renewcommand*{\itemhook}{
  \setlength{\topsep}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\parskip}{0pt}%
  \setlength{\itemsep}{0pt}}
\renewcommand*{\enumhook}{\itemhook{}}
\renewcommand*{\deschook}{\itemhook{}}

% classical \today definition
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%\newcommand{\widthofautobox}[1]{%
%  \widthof{\begin{tabular}{@{}l@{}}#1\end{tabular}}}

%\newcommand{\autobox}[2][b]{%
%  \parbox[#1]{\widthofautobox{#2}}{#2}}


\endinput


%% end of file `moderncv.cls'.
