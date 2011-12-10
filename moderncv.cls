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

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% execute default options
\ExecuteOptions{a4paper,11pt,color,final}

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
\RequirePackage{color}

% automatic loading of latin modern fonts if present on the system
\IfFileExists{lmodern.sty}
  {\RequirePackage[T1]{fontenc}\RequirePackage{lmodern}}
  {}

% symbols like \Telefon, \Mobilefone, \Letter and \Email
\RequirePackage{marvosym}

% page geometry
\addtolength{\oddsidemargin}{-54pt}
\addtolength{\textwidth}{109pt}
\addtolength{\topmargin}{-70pt}
\addtolength{\textheight}{122pt}
\addtolength{\marginparsep}{-5pt}
\addtolength{\marginparwidth}{-10pt}

% hyperrefs
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
%                style commands definitions
%-------------------------------------------------------------------------------
% symbols used 
\providecommand*{\listitemsymbol}{\Neutral}%{{\fontencoding{U}\fontfamily{ding}\selectfont\tiny\symbol{'102}}}
\providecommand*{\addresssymbol}{}
\providecommand*{\mobilesymbol}{\Mobilefone}
\providecommand*{\phonesymbol}{\Telefon}
\providecommand*{\faxsymbol}{\FAX}
\providecommand*{\emailsymbol}{\Letter}
\providecommand*{\homepagesymbol}{{\Large\ComputerMouse}}

% colors
\definecolor{firstnamecolor}{rgb}{0,0,0}
\definecolor{familynamecolor}{rgb}{0,0,0}
\definecolor{titlecolor}{rgb}{0,0,0}
\definecolor{addresscolor}{rgb}{0,0,0}
\definecolor{quotecolor}{rgb}{0,0,0}
\definecolor{sectionrectanglecolor}{rgb}{0,0,0}
\definecolor{sectiontitlecolor}{rgb}{0,0,0}
\definecolor{subsectioncolor}{rgb}{0,0,0}
\definecolor{hintcolor}{rgb}{0,0,0}

% fonts
\providecommand*{\firstnamefont}{}
\providecommand*{\familynamefont}{}
\providecommand*{\titlefont}{}
\providecommand*{\addressfont}{}
\providecommand*{\quotefont}{}
\providecommand*{\sectionfont}{}
\providecommand*{\subsectionfont}{}
\providecommand*{\hintfont}{\small}

% styles
\providecommand*{\firstnamestyle}[1]{{\firstnamefont\color{firstnamecolor}#1}}
\providecommand*{\familynamestyle}[1]{{\familynamefont\color{familynamecolor}#1}}
\providecommand*{\titlestyle}[1]{{\titlefont\color{titlecolor}#1}}
\providecommand*{\addresstyle}[1]{{\addressfont\color{addresscolor}#1}}
\providecommand*{\quotestyle}[1]{{\quotefont\color{quotecolor}#1}}
\providecommand*{\sectionstyle}[1]{{\sectionfont\color{sectiontitlecolor}#1}}
\providecommand*{\subsectionstyle}[1]{{\subsectionfont\color{subsectioncolor}#1}}
\providecommand*{\hintstyle}[1]{{\hintfont\color{hintcolor}#1}}

% makes the cv title
\newcommand*{\maketitle}{}%
\title{}% to avoid LaTeX complaining that \maketitle is a called without first a call to \title

% makes the cv footer
\newcommand*{\makefooter}

% loads a style
\newcommand*{\moderncvtheme}[2][]{
  \RequirePackage[#1]{moderncvtheme#2}}


%-------------------------------------------------------------------------------
%                structure commands definitions
%-------------------------------------------------------------------------------
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

% length used by the moderncv layout
% quote length
\newlength{\quotewidth}
% section lengths
\newlength{\hintscolumnwidth}
\setlength{\hintscolumnwidth}{0.15\textwidth}
\newlength{\separatorcolumnwidth}
\setlength{\separatorcolumnwidth}{0.025\textwidth}
\newlength{\maincolumnwidth}
% doubleitem lengths
\newlength{\doubleitemmaincolumnwidth}
% listitem lengths
\newlength{\listitemsymbolwidth}
\settowidth{\listitemsymbolwidth}{\listitemsymbol{}~}
\newlength{\listitemmaincolumnwidth}
% listdoubleitem lengths
\newlength{\listdoubleitemmaincolumnwidth}
% recompute all the lengths that depends on the text width
\newcommand*{\recomputethemelengths}{}
\newcommand*{\recomputelengths}{%
  \setlength{\quotewidth}{0.65\textwidth}%
  % main lenghts
  \setlength{\maincolumnwidth}{\textwidth}%
  \addtolength{\maincolumnwidth}{-\separatorcolumnwidth}%
  \addtolength{\maincolumnwidth}{-\hintscolumnwidth}%
  % listitem lengths
  \setlength{\listitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\listitemmaincolumnwidth}{-\listitemsymbolwidth}%
  % doubleitem lengths
  \setlength{\doubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\hintscolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\separatorcolumnwidth}%
  \setlength{\doubleitemmaincolumnwidth}{0.5\doubleitemmaincolumnwidth}%
  % listdoubleitem lengths
  \setlength{\listdoubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\listdoubleitemmaincolumnwidth}{-\listitemsymbolwidth}%
  \setlength{\listdoubleitemmaincolumnwidth}{0.475\listdoubleitemmaincolumnwidth}%
  % fancyhdr lengths
  \renewcommand{\headwidth}{\textwidth}%
  \recomputethemelengths{}}
\AtBeginDocument{\recomputelengths{}}

% draws a colored rectangle
% usage: \colorrule[optional height]{width}
%\newcommand*{\colorrule}[2][1ex]{{\color{sectionrectanglecolor}{\rule{#2}{#1}}}}

% usage: \section{<title>}
\newcommand*{\section}[1]{%
  \vspace*{2.5ex}%
  \parbox[m]{\hintscolumnwidth}{\raggedleft\hintfont{\color{sectionrectanglecolor}\rule{\hintscolumnwidth}{1ex}}}%
  \phantomsection{}% reset the anchor for hyperrefs
  \addcontentsline{toc}{part}{#1}%
  \hspace{\separatorcolumnwidth}%
  \parbox[m]{\maincolumnwidth}{\sectionstyle{#1}}%
  \par\nobreak\vskip 1ex\@afterheading}% to avoid a pagebreak after the heading
% starred variant, which is identical but defined to allow its use (e.g. for natbib compatibility, who uses \section*{} for the bibliography header)
\AtEndPreamble{%
  \@ifpackageloaded{natbib}
    {
      \RequirePackage{suffix}
      \WithSuffix\newcommand\section*{\section}
    }{}
}

% usage: \subsection{title}
\newcommand*{\subsection}[1]{%
  \begin{tabular}{@{}p{\hintscolumnwidth}@{\hspace{\separatorcolumnwidth}}p{\maincolumnwidth}@{}}%
 	  \raggedleft\hintfont{} &{\subsectionstyle{#1}}%
  \end{tabular}%
  \par\nobreak\vskip 0.5ex\@afterheading}% to avoid a pagebreak after the heading
%  \phantomsection{}% reset the anchor for hyperrefs
%  \addcontentsline{toc}{chapter}{#1}% does not work, the bookmark is placed at the same level as sections (placed themselves at part level to be visible, as hyperref does not allow sections without parents...)

% usage: \cvline{margintext}{linetext}
\newcommand*{\cvline}[3][.25em]{%
  \begin{tabular}{@{}p{\hintscolumnwidth}@{\hspace{\separatorcolumnwidth}}p{\maincolumnwidth}@{}}%
 	  \raggedleft\hintfont{#2} &{#3}%
  \end{tabular}\\[#1]}

% usage: \cvdoubleitem{subtitle}{text}{subtitle}{text}
\newcommand*{\cvdoubleitem}[4]{%
 \cvline{#1}{\begin{minipage}[t]{\doubleitemmaincolumnwidth}#2\end{minipage}%
 \hfill%
 \begin{minipage}[t]{\hintscolumnwidth}\raggedleft\hintfont{#3}\end{minipage}\hspace*{\separatorcolumnwidth}\begin{minipage}[t]{\doubleitemmaincolumnwidth}#4\end{minipage}}}

% usage: \cvlistitem[symbol]{point1}
\newcommand*{\cvlistitem}[2][\listitemsymbol{}]{%
  \cvline[0pt]{}{#1~\begin{minipage}[t]{\listitemmaincolumnwidth}#2\end{minipage}}}

% usage: \cvlistdoubleitem[symbol]{point1}{point2}
\newcommand*{\cvlistdoubleitem}[3][\listitemsymbol{}]{%
  \cvline[0pt]{}{#1~\begin{minipage}[t]{\listdoubleitemmaincolumnwidth}#2\end{minipage}%
  \hfill%
  \ifthenelse{\equal{#3}{}}%
    {}%
    {#1~\begin{minipage}[t]{\listdoubleitemmaincolumnwidth}#3\end{minipage}}}}

% usage: \cventry{years}{degree/job title}{institution/employer}{localization}{optionnal: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[6]{%
  \cvline{#1}{%
    {\bfseries#2}%
    \ifthenelse{\equal{#3}{}}{}{, {\slshape#3}}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{, #5}%
    .%
    \ifx&#6&%
      \else{\newline{}\begin{minipage}[t]{\linewidth}\small#6\end{minipage}}\fi%
  }}%

% usage (inside 'language' cvsection environment): \cvlanguage{name}{level}{comment}
\newcommand*{\cvlanguage}[3]{%
  \cvline{#1}{\begin{minipage}[t]{.225\maincolumnwidth}\textbf{#2}\end{minipage}\hfill\begin{minipage}[t]{0.725\maincolumnwidth}\raggedleft\footnotesize\itshape #3\end{minipage}}}

% usage (inside 'computer skills' cvsection environment): \cvcomputer{category}{programs}{category}{programs}
\newcommand*{\cvcomputer}[4]{%
  \cvdoubleitem{#1}{\small#2}{#3}{\small#4}}

% usage: \link[optional text]{link}
\newcommand*{\link}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{#2}{#2}}%
    {\href{#2}{#1}}}

% usage: \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{http://#2}{#2}}%
    {\href{http://#2}{#1}}}

% usage: \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{mailto:#2}{#2}}%
    {\href{mailto:#2}{#1}}}

% usage: \nopagenumbers{}
\newif\if@displaypagenumbers\@displaypagenumberstrue
\newcommand*{\nopagenumbers}{\@displaypagenumbersfalse}
\AtEndPreamble{%
\AtBeginDocument{%
  \if@displaypagenumbers%
    \@ifundefined{r@lastpage}{}{%
      \ifthenelse{\pageref{lastpage} > 1}{%
        \fancypagestyle{plain}{%
          \fancyfoot[r]{\addressfont\color{quotecolor}\footnotesize\thepage/\pageref{lastpage}}}%
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
\newenvironment{thebibliography}[1]%
  {%
    \bibliographyhead{\refname}%
    \small%
    \begin{list}{\bibliographyitemlabel}%
      {%
        \setlength{\topsep}{0pt}%
        \setlength{\labelwidth}{\hintscolumnwidth}%
        \setlength{\labelsep}{\separatorcolumnwidth}%
        \leftmargin\labelwidth%
        \advance\leftmargin\labelsep%
        \@openbib@code%
        \usecounter{enumiv}%
        \let\p@enumiv\@empty%
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
        \sloppy\clubpenalty4000\widowpenalty4000%
%        \sfcode`\.\@m%
%        \sfcode `\=1000\relax%
  }%
  {%
    \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
    \end{list}%
  }
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

% itemize, enumerate and description environment
\setlength{\leftmargini}   {1.2em}
\leftmargin\leftmargini
\setlength{\leftmarginii}  {1em}
\setlength{\leftmarginiii} {1.87em}
\setlength{\leftmarginiv}  {1.7em}
\setlength{\leftmarginv}   {1em}
\setlength{\leftmarginvi}  {1em}
\setlength{\labelsep}      {.5em}
\setlength{\labelwidth}    {\leftmargini}
\addtolength{\labelwidth}  {-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
% itemize labels
\newcommand\labelitemi{\listitemsymbol{}}
\newcommand\labelitemii{{\large\bfseries-}}
\newcommand\labelitemiii{\textperiodcentered}%{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
% enumerate labels
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
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


\endinput


%% end of file `moderncv.cls'.
