%% start of file `moderncv.cls'.

%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moderncv}[2006/03/06 v0.2 modern curriculum vitae document class]


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
% (this should perhaps be left to the user...)
\RequirePackage[top=2cm, bottom=2.5cm, left=2.25cm, right=2.25cm]{geometry}

% hyperrefs
\RequirePackage{url}
\ifpdf
  \RequirePackage[pdftex,pdfborder=0,breaklinks,baseurl=http://,pdfpagemode=None,pdfstartview=FitH,pdfpagelayout=SinglePage,pdfstartpage=1]{hyperref}
  \AtEndOfClass{%
    \AtBeginDocument{%
      \hypersetup{%
        pdfauthor   = \@firstname~\@familyname,%
        pdftitle    = \@title,%
        pdfsubject  = \@firstname~\@familyname,%
        pdfkeywords = \@firstname~\@familyname{} curriculum vit\ae{},%
        pdfcreator  = \LaTeX{} with `moderncv' package,%
        pdfproducer = \LaTeX}}}
\else
  \RequirePackage[dvips]{hyperref}\fi
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

% colors
\definecolor{firstnamecolor}{rgb}{0,0,0}
\definecolor{familynamecolor}{rgb}{0,0,0}
\definecolor{titlecolor}{rgb}{0,0,0}
\definecolor{addresscolor}{rgb}{0,0,0}
\definecolor{quotecolor}{rgb}{0,0,0}
\definecolor{sectionrectanglecolor}{rgb}{0,0,0}
\definecolor{sectiontitlecolor}{rgb}{0,0,0}

% fonts
\providecommand*{\firstnamefont}{}
\providecommand*{\familynamefont}{}
\providecommand*{\titlefont}{}
\providecommand*{\addressfont}{}
\providecommand*{\quotefont}{}
\providecommand*{\sectionfont}{}
\providecommand*{\subsectionfont}{}

% styles
\providecommand*{\firstnamestyle}[1]{{\firstnamefont\color{firstnamecolor}#1}}
\providecommand*{\familynamestyle}[1]{{\familynamefont\color{familynamecolor}#1}}
\providecommand*{\titlestyle}[1]{{\titlefont\color{titlecolor}#1}}
\providecommand*{\addresstyle}[1]{{\addressfont\color{addresscolor}#1}}
\providecommand*{\quotestyle}[1]{{\quotefont\color{quotecolor}#1}}
\providecommand*{\sectionstyle}[1]{{\sectionfont\color{sectiontitlecolor}#1}}
\providecommand*{\subsectionstyle}[1]{{\subsectionfont#1}}

% styles: casual (default), classic, ...
\newcommand*{\moderncvstyle}[2][]{
  \def\@moderncvstyle{#2}
  \def\@moderncvstyleoptions{#1}}
\AtBeginDocument{\RequirePackage[\@moderncvstyleoptions]{moderncvstyle\@moderncvstyle}}

% load default style
\moderncvstyle{casual}


%-------------------------------------------------------------------------------
%                structure commands definitions
%-------------------------------------------------------------------------------
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\renewcommand*{\title}[1]{\def\@title{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\newcommand*{\quote}[1]{\def\@quote{#1}}
\firstname{}
\familyname{}
\title{}
\address{}
\phone{}
\email{}
\extrainfo{}
\quote{}

% makes the cv title
\renewcommand*{\maketitle}{}%

% make a quote
\newcommand*{\makequote}{%
  {\centering{%
    \begin{minipage}{\textwidth}\centering\quotestyle{\@quote}\end{minipage}}}\\[3em]}

% draws a colored rectangle
% usage: \colorrule[optional height]{width}
%\newcommand*{\colorrule}[2][1ex]{{\color{sectionrectanglecolor}{\rule{#2}{#1}}}}

% usage: \section[optional width <= .8\textwidth]{<title>}
\newif\if@sectionopen \@sectionopenfalse
\newcommand*{\closesection}{%
  \if@sectionopen
    \end{tabular}%
    \par\null%
    \@sectionopenfalse\fi}
\AtEndDocument{\closesection{}}
\newcommand*{\section}[2][0.825]{%
  \closesection{}%
  \@sectionopentrue%
  \addcontentsline{toc}{part}{#2}
  \begin{tabular}[t]{@{}r@{\hspace{.025\textwidth}}@{}p{#1\textwidth}@{}}%
%  \colorrule{.15\textwidth}&\mbox{\color{sectiontitlecolor}\sectionfont#2}\\[1ex]}%
  {\color{sectionrectanglecolor}\rule{0.15\textwidth}{1ex}}&\mbox{\color{sectiontitlecolor}\sectionfont#2}\\[1ex]}%

% usage (inside section): \subsection{title}
\newcommand*{\subsection}[1]{%
  &{\subsectionfont#1}\\[1ex]}

% usage (inside section): \cvline[optional width <= .8\textwidth]{leftmark}{text}
\newcommand*{\cvline}[3][.825]{%
  \begin{minipage}[t]{0.15\textwidth}\raggedleft\small\sffamily #2\end{minipage}&\begin{minipage}[t]{#1\textwidth}#3\end{minipage}\\}

% usage (inside section): \cvitem[optional width <= .8\textwidth]{leftmark}{text}
\newcommand*{\cvitem}[3][.825]{%
  \cvline[#1]{#2}{#3\vspace*{.75em}}}   % the \vspace*{} inside the cvline environment is a hack... (should conceptually be outside the environment)

% usage (inside section}: \cvdoubleitem{subtitle}{text}{subtitle}{text}
\newcommand*{\cvdoubleitem}[4]{%
 \cvitem{#1}{\begin{minipage}[t]{.4125\textwidth}#2\end{minipage}\hfill\begin{minipage}[t]{.125\textwidth}\raggedleft\small\sffamily#3\end{minipage}\hspace*{.025\textwidth}\begin{minipage}[t]{.4125\textwidth}#4\end{minipage}}}%the second column title should have 0.1818 = 0.15*1/0.825 as width, and the data columns shoudl have 0.395 as width to be equal. But this is not achived here, by purpose...

% usage (inside section): \cvlistitem{point1}
\newcommand*{\cvlistitem}[1]{%
  \cvline{}{\listitemsymbol{}~#1}}

% usage (inside section): \cvlistdoubleitem{point1}{point2}
\newcommand*{\cvlistdoubleitem}[2]{%
  \vspace{0.25em}&\listitemsymbol{}~\begin{minipage}[t]{0.375\textwidth}#1\end{minipage}%
  \hfill%
  \ifthenelse{\equal{#2}{}}%
    {}%
    {\listitemsymbol{}~\begin{minipage}[t]{0.375\textwidth}#2\end{minipage}\\}}

% usage : \cventry{years}{degree/job title}{institution/employer}{localization}{optionnal: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[6]{%
  \cvitem{#1}{%
    {\bfseries#2}%
    \ifthenelse{\equal{#3}{}}{}{, {\slshape#3}}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{, #5}%
    .%
    \ifthenelse{\equal{#6}{}}{}{\\\begin{minipage}{\textwidth}\small#6\end{minipage}}}}

% usage (inside 'language' cvsection environment): \cvlanguage{name}{level}{comment}
\newcommand*{\cvlanguage}[3]{%
  \cvitem{#1}{\begin{minipage}[t]{.225\textwidth}\textbf{#2}\end{minipage}\hfill\begin{minipage}[t]{0.725\textwidth}\raggedleft\footnotesize\itshape #3\end{minipage}}}

% usage (inside 'computer skills' cvsection environment): \cvcomputer{category}{programs}{category}{programs}
\newcommand*{\cvcomputer}[4]{%
  \vspace*{-.5em}\cvdoubleitem{#1}{\small#2}{#3}{\small#4}}

% usage: \weblink[optional text]{link}
\newcommand*{\weblink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\def\@linktext{#2}}%
    {\def\@linktext{#1}}%
  \href{#2}{\@linktext{}}}

% usage: \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\def\@linktext{#2}}%
    {\def\@linktext{#1}}%
  \href{http://#2}{\@linktext{}}}

% usage: \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\def\@linktext{#2}}%
    {\def\@linktext{#1}}%
  \href{mailto:#2}{\@linktext{}}}


\endinput

%% end of file `moderncv.cls'.
