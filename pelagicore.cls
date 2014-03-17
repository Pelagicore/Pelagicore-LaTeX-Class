\ProvidesClass{pelagicore}
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{multirow}
\usepackage{lastpage}
\usepackage{xcolor, colortbl}
\usepackage{fancyhdr}
\usepackage[default]{sourcesanspro}
\usepackage{tabularx}

\LoadClass[11pt]{article}
\usepackage{enumitem}
\usepackage[hyphens]{url}
\usepackage{parskip}

% Page margin settings
\usepackage[
  top=3cm,
  bottom=3cm,
  left=3.5cm,
  right=3.5cm,
  headheight=14.5pt,
 ]{geometry}

% Configurable parameters
\let\@subtitle\@empty
\let\@releasetitle\@empty
\let\@revision\@empty
\let\@revisiondate\@empty
\let\@approvedby\@empty
\let\@lang\@empty
\let\@location\@empty
\let\@filename\@empty
\let\@docnumber\@empty
\def \@frontlogofile{pelagicorelogo.eps}
\def \@frontlogowidth{10cm}
\def \@bannerlogofile{pelagicorelogo.eps}
\def \@bannerlogoheight{0.23in}
\def \@company{Pelagicore AB}
\def \@status{Draft}

% Definition of conditionals
\newif\ifusefrontmetadata
\newif\ifversioninfooter

% Commandification of parameters
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\revision}[1]{\gdef\@revision{#1}}
\newcommand{\releasetitle}[1]{\gdef\@releasetitle{#1}}
\newcommand{\revisiondate}[1]{\gdef\@revisiondate{#1}}
\newcommand{\approvedby}[1]{\gdef\@approvedby{#1}}
\newcommand{\lang}[1]{\gdef\@lang{#1}}
\newcommand{\location}[1]{\gdef\@location{#1}}
\newcommand{\filename}[1]{\gdef\@filename{#1}}
\newcommand{\docnumber}[1]{\gdef\@docnumber{#1}}
\newcommand{\frontlogofile}[1]{\gdef\@frontlogofile{#1}}
\newcommand{\bannerlogofile}[1]{\gdef\@bannerlogofile{#1}}
\newcommand{\bannerlogoheight}[1]{\gdef\@bannerlogoheight{#1}}
\newcommand{\frontlogowidth}[1]{\gdef\@frontlogowidth{#1}}
\newcommand{\company}[1]{\gdef\@company{#1}}
\newcommand{\status}[1]{\gdef\@status{#1}}

% Titlepage
\newcommand{\boxentry}[2]{\tiny #1 \hfill \small #2}

\renewcommand\maketitle{
    \begin{center}
        \includegraphics[width=\@frontlogowidth]{\@frontlogofile}
        \vskip 1cm
        {\Huge\@title\par}
        {\Large\@subtitle\par}
        {\Large\@releasetitle\par}
        \ifusefrontmetadata
        {
            \null\vfill
            \begin{tabularx}{\textwidth}{ | X | l | c | r | r | }
              \hline
              \boxentry{Prep.}{\@author} & \boxentry{Revision}{\@revision} & \boxentry{Date}{\@revisiondate} &
                    \multirow{3}{4em}{\vspace{0.5em}\tiny{No. of pages} \\ \centering \large{\pageref{LastPage}} \vspace {1em}}\\
              \cline{1-3}
              \boxentry{Qual.}{\@approvedby} & \boxentry{Language}{\@lang} & \boxentry{Location}{\@location} &\\
              \cline{1-3}
              \multicolumn{2}{| l |}{\boxentry{File Name}{\@filename}} & \boxentry{Status}{\@status} &\\
              \hline
            \end{tabularx}
        }
        \fi
    \end{center}
\thispagestyle{empty}
\clearpage
\setcounter{page}{1}
}

% Colors
\definecolor{orange}{RGB}{255,89,13}
\definecolor{gray}{RGB}{120,120,120}
\definecolor{blue}{RGB}{114,187,194}

% Section settings
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\color{orange}}}

\renewcommand\subsection{\@startsection {subsection}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries\color{orange}}}
\renewcommand\subsubsection{\@startsection {subsubsection}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries\color{orange}}}

% Header settings
\renewcommand{\footrule}{\hbox to\headwidth{%
  \color{gray}\leaders\hrule height \footrulewidth\hfill}\vskip -1em}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.1pt}
\setlength{\headwidth}{\textwidth}
\fancyhead[L]{}% empty left
\fancyhead[R]{ % right
   \includegraphics[height=\@bannerlogoheight]{\@bannerlogofile}
}

% Footer settings
\fancyfoot[L]{\color{gray}{\@company}}
\fancyfoot[C]{\color{gray}{
    \ifversioninfooter
        \@docnumber --- \@revision
    \fi
}}
\fancyfoot[R]{\color{gray}{Page \thepage\hspace{3pt}of\hspace{3pt}\pageref{LastPage}}}
\pagestyle{fancy}

\let\stdsection\section
\renewcommand\section{\newpage\stdsection}

% Make the borders of tables light-gray
\arrayrulecolor{gray!40}

% Reduce item spacing in lists
\setenumerate{label=\arabic*), itemsep=0pt,topsep=3pt}
\setitemize{itemsep=0pt,topsep=3pt}
