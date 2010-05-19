%% start of file `moderncv.cls'.
%% Copyright 2006-2008 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.


%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moderncv}[2008/06/17 v0.7 modern curriculum vitae document class]


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

% nolmodern option
\newif\if@lmodern\@lmoderntrue
\DeclareOption{nolmodern}{\@lmodernfalse}

% nocolor option
\newif\if@color\@colortrue
\DeclareOption{nocolor}{\@colorfalse}

% execute default options
\ExecuteOptions{a4paper,11pt,color,final}

% process given options
\ProcessOptions\relax
\input{size1\@ptsize.clo}


%-------------------------------------------------------------------------------
%                required packages
%-------------------------------------------------------------------------------
% ifthen package
\RequirePackage{ifthen}

% ifpdf package
\RequirePackage{ifpdf}

% color package
\ifpdf
  \RequirePackage[pdftex]{color}
\else
  \RequirePackage[dvips]{color}
\fi

% fontenc package
\RequirePackage[T1]{fontenc}

% scalable Computer Modern fonts
%\usepackage{type1cm}

% latin modern fonts
\AtEndOfClass{%
  \if@lmodern
    \RequirePackage{lmodern}\fi}

% symbols like \Telefon, \Mobilefone, \Letter and \Email
\RequirePackage{marvosym}

% extended characters of T1 in .ps + other guillemets
%\RequirePackage{ae,aecompl,aeguill}

% page geometry
\addtolength{\oddsidemargin}{-54pt}
\addtolength{\textwidth}{109pt}
\addtolength{\topmargin}{-70pt}
\addtolength{\textheight}{122pt}
\addtolength{\marginparsep}{-5pt}
\addtolength{\marginparwidth}{-10pt}

% hyperrefs
\RequirePackage{url}
\ifpdf
  \RequirePackage[pdftex,]{hyperref}
\else
  \RequirePackage[dvips]{hyperref}\fi
\hypersetup{%
  breaklinks,
  baseurl       = http://,%
  pdfborder     = 0 0 0,%
  pdfpagemode   = UseNone,%
%  pdfstartview  = XYZ,%
  pdfstartpage  = 1,%
  pdfcreator    = \LaTeX{} with `moderncv' package,%
  pdfproducer   = \LaTeX}
\AtEndOfClass{%
  \AtBeginDocument{%
    \hypersetup{%
      pdfauthor     = \@firstname~\@familyname,%
      pdftitle      = \@title,%
      pdfsubject    = \@firstname~\@familyname,%
      pdfkeywords   = \@firstname~\@familyname{} curriculum vit\ae{}}}}
\urlstyle{tt}

% graphics
\ifpdf
  \RequirePackage[pdftex]{graphicx}
\else
  \RequirePackage[dvips]{graphicx}\fi

% headers and footers
\usepackage{fancyhdr}
\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}}
\pagestyle{plain}

% compatibility package with older versions of moderncv
\RequirePackageWithOptions{moderncvcompatibility}


%-------------------------------------------------------------------------------
%                class definition
%-------------------------------------------------------------------------------
% minimal base settings
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{empty}
\pagenumbering{arabic}
\raggedbottom
\onecolumn


%-------------------------------------------------------------------------------
%                style commands definitions
%-------------------------------------------------------------------------------
% symbols used 
\providecommand*{\listitemsymbol}{\textbullet}
\providecommand*{\addresssymbol}{}
\providecommand*{\mobilesymbol}{\Mobilefone}
\providecommand*{\phonesymbol}{\Telefon}
\providecommand*{\faxsymbol}{\FAX}
\providecommand*{\emailsymbol}{\Letter}

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
\providecommand*{\hintfont}{\small\sffamily}

% styles
\providecommand*{\firstnamestyle}[1]{{\firstnamefont\color{firstnamecolor}#1}}
\providecommand*{\familynamestyle}[1]{{\familynamefont\color{familynamecolor}#1}}
\providecommand*{\titlestyle}[1]{{\titlefont\color{titlecolor}#1}}
\providecommand*{\addresstyle}[1]{{\addressfont\color{addresscolor}#1}}
\providecommand*{\quotestyle}[1]{{\quotefont\color{quotecolor}#1}}
\providecommand*{\sectionstyle}[1]{{\sectionfont\color{sectiontitlecolor}#1}}
\providecommand*{\subsectionstyle}[1]{{\subsectionfont\color{subsectioncolor}#1}}
\providecommand*{\hintstyle}[1]{{\hintfont\color{hintcolor}#1}}

% themes: casual (default), classic, ...
\newcommand*{\moderncvtheme}[2][]{
  \def\@moderncvtheme{#2}
  \def\@moderncvthemeoptions{#1}}
\moderncvtheme{casual}   % default theme
\AtBeginDocument{\RequirePackage[\@moderncvthemeoptions]{moderncvtheme\@moderncvtheme}}


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
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\def\@photowidth{0pt}
\newcommand*{\photo}[2][64pt]{\def\@photowidth{#1}\def\@photo{#2}}
\newcommand*{\quote}[1]{\def\@quote{#1}}

% length used by the moderncv layout
% quote length
\newlength{\quotewidth}
% section lengths
\newlength{\hintscolumnwidth}
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
  \recomputethemelengths}
\setlength{\hintscolumnwidth}{0.15\textwidth}
\recomputelengths

% makes the cv title
\title{}% to avoid LaTeX complaining that \maketitle is a called without first a call to \title
\renewcommand*{\maketitle}{}%

% draws a colored rectangle
% usage: \colorrule[optional height]{width}
%\newcommand*{\colorrule}[2][1ex]{{\color{sectionrectanglecolor}{\rule{#2}{#1}}}}

% usage: \section{<title>}
\newcommand*{\section}[1]{%
	\vspace*{2.5ex \@plus 1ex \@minus .2ex}%
  \phantomsection{}% reset the anchor for hyperrefs
  \addcontentsline{toc}{part}{#1}%
  \parbox[m]{\hintscolumnwidth}{\raggedleft\hintfont{\color{sectionrectanglecolor}\rule{\hintscolumnwidth}{1ex}}}%
  \hspace{\separatorcolumnwidth}%
  \parbox[m]{\maincolumnwidth}{\sectionstyle{#1}}\\[1ex]}
%  \cvline[1ex]{\color{sectionrectanglecolor}\rule[0]{\hintscolumnwidth}{1ex}}{\sectionstyle{#1}}}% gives bad alignment of rectangle; too bad m{width} columns seem not to work as a valid column definition for tabular environments

% usage: \subsection{title}
\newcommand*{\subsection}[1]{%
  \cvline[0.45em]{}{\subsectionstyle{#1}}}

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
    \ifx#3\else{, {\slshape#3}}\fi%
    \ifx#4\else{, #4}\fi%
    \ifx#5\else{, #5}\fi%
    .%
    \ifx#6\else{\newline{}\begin{minipage}[t]{\linewidth}\small#6\end{minipage}}\fi
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
\AtBeginDocument{%
  \if@displaypagenumbers%
    \@ifundefined{r@lastpage}{}{%
      \ifthenelse{\pageref{lastpage} > 1}{%
      \fancypagestyle{plain}{%
        \fancyfoot[r]{\addressfont\color{quotecolor}\footnotesize\thepage/\pageref{lastpage}}}%
      \pagestyle{plain}}{}}%
  \AtEndDocument{\label{lastpage}}%
  \fi}

% thebibliography environment, for use with BibTeX
\newcommand{\refname}{Publications}
\newlength{\bibindent}
\setlength{\bibindent}{1.5em}
% bibliography item label
\newcommand*{\bibliographyitemlabel}{}% use \@biblabel{\arabic{enumiv}} for BibTeX labels
\newenvironment{thebibliography}[1]%
  {%
    \section{\refname}%
%    \vspace*{-0.65em}%
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

% the classical \today definition
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}


\endinput


%% end of file `moderncv.cls'.
