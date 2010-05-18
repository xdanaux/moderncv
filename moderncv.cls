%% start of file `moderncv.cls'.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{moderncv}[2006/03/01 v0.9 modern curriculum vitae document class]

\RequirePackage{ifpdf}

\ifpdf
  \RequirePackage[pdftex]{color}
\else
  \RequirePackage[dvips]{color}
\fi

%-------------------------------------------------------------------------------
%                class options
%-------------------------------------------------------------------------------
% paper size option
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}\fi

% font size options
\newcommand\@ptsize{}
\if@compatibility
  \renewcommand\@ptsize{0}
\else
  \DeclareOption{10pt}{\renewcommand\@ptsize{0}}\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility
\else
  \DeclareOption{final}{\setlength\overfullrule{0pt}}\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility
\else
  \DeclareOption{notitlepage}{\@titlepagefalse}\fi

% colored/blackandwhite option
\newif\if@color\@colortrue
\DeclareOption{color}{%
%  \definecolor{firstnamecolor}{rgb}{0.5,0.5,0.5}% gray-blue
%  \definecolor{familynamecolor}{rgb}{0.2,0.4,0.65}%
  \definecolor{firstnamecolor}{rgb}{0.65,0.65,0.65}%
  \definecolor{familynamecolor}{rgb}{0.45,0.45,0.45}%
  \definecolor{quotecolor}{rgb}{0.35,0.35,0.35}%
  \definecolor{sectionrectanglecolor}{rgb}{0.25,0.5,0.75}%
  \definecolor{sectiontitlecolor}{rgb}{0.2,0.4,0.65}%
  \definecolor{footertextcolor}{rgb}{0.35,0.35,0.35}%
  \definecolor{footersymbolcolor}{rgb}{0.25,0.5,0.75}}
\newif\if@blackandwhite\@blackandwhitefalse
\DeclareOption{blackandwhite}{%
  \@blackandwhitetrue%
  \definecolor{firstnamecolor}{rgb}{0.5,0.5,0.5}%
  \definecolor{familynamecolor}{rgb}{0,0,0}%
  \definecolor{quotecolor}{rgb}{0.35,0.35,0.35}%
  \definecolor{sectionrectanglecolor}{rgb}{0.75,0.75,0.75}%
  \definecolor{sectiontitlecolor}{rgb}{0.35,0.35,0.35}%
  \definecolor{weblink}{rgb}{0.5,0.5,0.5}%
  \definecolor{footertextcolor}{rgb}{0.35,0.35,0.35}%
  \definecolor{footersymbolcolor}{rgb}{0.75,0.75,0.75}}

% styles: casual or classic (default)
\newif\if@styleclassic\@styleclassicfalse
\DeclareOption{classic}{%
  \@styleclassictrue%
  \@stylecasualfalse}
\newif\if@stylecasual\@stylecasualfalse
\DeclareOption{casual}{%
  \@styleclassicfalse%
  \@stylecasualtrue}

% execute default options
\ExecuteOptions{a4paper,11pt,color,classic,final}

% process given options
\ProcessOptions

\input{size1\@ptsize.clo}
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
%                packages import
%-------------------------------------------------------------------------------
% font encoding
\RequirePackage[T1]{fontenc}

% scalable Computer Modern fonts
%\usepackage{type1cm}

% latin modern fonts
\RequirePackage{lmodern}

% symbols like \Telefon, \Mobilefone, \Letter and \Email
\RequirePackage{marvosym}

% extended characters of T1 in .ps + other guillemets
%\RequirePackage{ae,aecompl,aeguill}

% page geometry
%\RequirePackage[top=1.75cm, bottom=2.25cm, left=2cm, right=2cm]{geometry}
\RequirePackage[top=2cm, bottom=2.5cm, left=2.25cm, right=2.25cm]{geometry}

% typewriter font
\renewcommand{\ttdefault}{pcr}

% hyperrefs
\RequirePackage{url}
\ifpdf
  \RequirePackage[pdftex,pdfborder=0,breaklinks,baseurl=http://,pdfpagemode=None,pdfstartview=FitH,pdfpagelayout=SinglePage,pdfstartpage=1]{hyperref}
  \AtBeginDocument{\hypersetup{
    pdfauthor   = \@firstname~\@familyname,%
    pdftitle    = \@title,%
    pdfsubject  = \@firstname~\@familyname,%
    pdfkeywords = \@firstname~\@familyname{} curriculum vit\ae{},%
    pdfcreator  = \LaTeX{} with `moderncv' package,%
    pdfproducer = \LaTeX}}
  \RequirePackage[pdftex]{graphicx}
\else
  \RequirePackage[dvips]{hyperref,graphicx}\fi
\urlstyle{tt}

% headers and footers
\usepackage{fancyhdr}
\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyhf{}}
\pagestyle{plain}

%-------------------------------------------------------------------------------
%                style customization
%-------------------------------------------------------------------------------
% symbols used 
\newcommand*{\listsymbol}{\textbullet}
\newcommand*{\footersymbol}{\textbullet}

% fonts
%\newcommand*{\namefont}{\fontsize{34}{36}\sffamily\mdseries\upshape}
\newcommand*{\quotefont}{\large\sffamily\slshape}
\newcommand*{\sectionfont}{\Large\sffamily\mdseries\upshape}
\newcommand*{\subsectionfont}{\normalsize\sffamily\mdseries\upshape}
\newcommand*{\footerfont}{\normalsize\sffamily\mdseries\slshape}

% classic style
\if@styleclassic
  \typeout{moderncv with classic style}
  \renewcommand*{\title}[1]{\def\@title{#1}}
  \title{}
  \newcommand*{\namefont}{\fontsize{34}{36}\sffamily\mdseries\upshape}
  \newcommand*{\titlefont}{\LARGE\sffamily\mdseries\slshape}
  \newcommand*{\addressfont}{\rmfamily\mdseries\slshape}
  \if@color
    \definecolor{namecolor}{rgb}{0,0,0}
    \definecolor{titlecolor}{rgb}{0.35,0.35,0.35}
    \definecolor{addresscolor}{rgb}{0.25,0.5,0.75}
  \else
    \definecolor{namecolor}{rgb}{0,0,0}
    \definecolor{titlecolor}{rgb}{0.35,0.35,0.35}
    \definecolor{addresscolor}{rgb}{0.35,0.35,0.35}\fi\else
% casual style
\if@stylecasual
  \typeout{moderncv with casual style}
  \newcommand*{\namefont}{\fontsize{38}{40}\sffamily\mdseries\upshape}
  \AtBeginDocument{\makefooter}\fi\fi

% see also the color definitions at the color/blackandwhite option definition


%-------------------------------------------------------------------------------
%                commands definitions
%-------------------------------------------------------------------------------
\RequirePackage{ifthen}

\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\newcommand*{\quote}[1]{\def\@quote{#1}}
\firstname{}
\familyname{}
\address{}
\phone{}
\email{}
\extrainfo{}
\quote{}

% makes the cv footer
\newcommand*{\makefooter}{%
  \fancypagestyle{plain}{%
    \fancyfoot[c]{%
      \footerfont%
      \color{footertextcolor}\@address%
      ~~\color{footersymbolcolor}\footersymbol~~%
      \color{footertextcolor}\Telefon~\@phone%
      ~~\color{footersymbolcolor}\footersymbol~~%
      \color{footertextcolor}\Letter~\emaillink{\@email}}}%
  \pagestyle{plain}}

% makes the cv title
\if@stylecasual
\renewcommand*{\maketitle}{%
%  {\raggedleft{\namefont\color{firstnamecolor}\@firstname~\color{familynamecolor}\@familyname}\\[-.35em]}%
  {\raggedleft{\namefont\color{firstnamecolor}\@firstname\color{familynamecolor}\@familyname}\\[-.35em]}%
  {\color{firstnamecolor}\rule{\textwidth}{.25ex}\\[2.5em]}}%
\else\if@styleclassic
\renewcommand*{\maketitle}{%
  \begin{minipage}[t]{.6\textwidth}%
    {\namefont\color{namecolor}\@firstname~\@familyname}%
    \ifthenelse{\equal{\@title}{}}%
      {}%
      {\\[1.25em]{\titlefont\color{titlecolor}\@title}}%
  \end{minipage}%
  \begin{minipage}[t]{.4\textwidth}%
    \raggedleft\addressfont\color{addresscolor}\@address\\[0.2em]%
    \Telefon~\@phone\\[.2em]%
    \Letter~\emaillink{\@email}%
    \ifthenelse{\equal{\@extrainfo}{}}%
      {}%
      {\\[0.2em]\@extrainfo}
  \end{minipage}%
%  \\[-\baselinestretch\baselineskip]%
%  {\titlefont\color{titlecolor}\@title}%
  \\[3em]}\fi\fi

% make a quote
\newcommand*{\makequote}{%
  {\centering{%
    \vbox{\centering\quotefont\color{quotecolor}\@quote}}}\\[3em]}

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
 \cvitem{#1}{\begin{minipage}[t]{.4125\textwidth}#2\end{minipage}\hfill\begin{minipage}[t]{.125\textwidth}\raggedleft\small\sffamily#3\end{minipage}\hspace*{.025\textwidth}\begin{minipage}[t]{.4125\textwidth}#4\end{minipage}}}%the second column title should have 0.1818 = 0.15*1/0.825 as width, and the data columns shoudl ahve 0.395 as width to be equal. But this is not achived here, by purpose...

% usage (inside 'resume' cvsection environment): \cvresume{point1}{point2}
\newcommand*{\cvresume}[2]{%
  \vspace{0.25em}&\listsymbol{}~\begin{minipage}[t]{0.375\textwidth}#1\end{minipage}%
  \hfill%
  \ifthenelse{\equal{#2}{}}%
    {}%
    {\listsymbol{}~\begin{minipage}[t]{0.375\textwidth}#2\end{minipage}\\}}

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
