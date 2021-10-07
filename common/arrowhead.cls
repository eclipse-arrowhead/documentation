% Copyright (c) 2021-10-07 Eclipse Arrowhead Project
%
% This program and the accompanying materials are made available under the
% terms of the Eclipse Public License 2.0 which is available at
% http://www.eclipse.org/legal/epl-2.0.
%
% SPDX-License-Identifier: EPL-2.0

\def\fileversion{1.4}
\def\filedate{2021/10/07}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{arrowhead}[\filedate\space Version \fileversion\space]
\LoadClass{article}

\RequirePackage[font={small}]{caption}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[hmargin=2cm,top=4cm,headheight=4cm,bottom=2.4cm,footskip=0.4cm]{geometry}
\RequirePackage[nottoc,numbib]{tocbibind}
\RequirePackage[pdftex]{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{couriers}
\RequirePackage{fancyhdr}
\RequirePackage{helvet}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{listings}
\RequirePackage{microtype}
\RequirePackage{tabularx}
\RequirePackage{xstring}
\RequirePackage{xparse}

\definecolor{ArrowheadBlue}{HTML}{006F99}
\definecolor{ArrowheadGrey}{HTML}{333333}
\definecolor{ArrowheadOrange}{HTML}{D77734}
\definecolor{ArrowheadPurple}{HTML}{8F3165}
\definecolor{ArrowheadTeal}{HTML}{21A28F}
\definecolor{ArrowheadYellow}{HTML}{F6E14E}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\captionsetup{width=0.94\textwidth}

\ProcessOptions\relax

\NewDocumentCommand{\ArrowheadTitle}{m}{\newcommand{\arrowtitle}{#1}}
\NewDocumentCommand{\ArrowheadServiceID}{m}{\newcommand{\arrowid}{#1}}
\NewDocumentCommand{\ArrowheadType}{m}{\newcommand{\arrowtype}{#1}}
\NewDocumentCommand{\ArrowheadTypeShort}{m}{\newcommand{\arrowtypeshort}{#1}}
\NewDocumentCommand{\ArrowheadVersion}{m}{\newcommand{\arrowversion}{#1}}
\NewDocumentCommand{\ArrowheadDate}{m}{\newcommand{\arrowdate}{#1}}
\NewDocumentCommand{\ArrowheadAuthor}{m}{
  \IfSubStr{#1}{ and }{
    \newcommand{\ifarrowauthormultiple}[2]{##1}
    \newcommand{\arrowauthorfirst}{\StrLeft{#1}{\StrPosition{#1}{ and }}}
    \newcommand{\arrowauthor}{\StrSubstitute{#1}{ and }{, }}
  }{
    \newcommand{\ifarrowauthormultiple}[2]{##2}
    \newcommand{\arrowauthorfirst}{#1}
    \newcommand{\arrowauthor}{#1}
  }
}
\NewDocumentCommand{\ArrowheadStatus}{m}{\newcommand{\arrowstatus}{#1}}
\NewDocumentCommand{\ArrowheadContact}{m}{\newcommand{\arrowcontact}{#1}}
\NewDocumentCommand{\ArrowheadFooter}{m}{\newcommand{\arrowfooter}{#1}}
\NewDocumentCommand{\ArrowheadSetup}{}{
  \hypersetup{
    pdftitle={\arrowtitle\ -- \ \arrowtypeshort},
  }
}
\NewDocumentCommand{\ArrowheadBox}{mm}{
  {
    \vspace*{1.5\baselineskip}
    \setlength{\tabcolsep}{0pt}
    \renewcommand*{\arraystretch}{0}
    \noindent
    \begin{tabularx}{\dimexpr\textwidth-1pt-2.75ex\relax}{
      @{\textcolor[RGB]{0,72,117}{\vrule width 1pt}}
      @{\hspace{2.75ex}}
      X
    }
    \small{\textcolor[RGB]{0,72,117}{\textbf{#1}} #2}
    \end{tabularx}
  }
}

\makeatletter

\let\originsection\section
\renewcommand\section{\newpage\originsection}

\let\origsubsubsection\subsubsection
\renewcommand\subsubsection{\@ifstar{\starsubsubsection}{\nostarsubsubsection}}
\newcommand\starsubsubsection[1]{\vspace*{-0.5ex}\origsubsubsection*{#1}\vspace*{-0.75ex}}
\newcommand\nostarsubsubsection[1]{\vspace*{-0.5ex}\origsubsubsection{#1}\vspace*{-0.75ex}}

\renewcommand\tiny{\@setfontsize\tiny{6}{7}}
\renewenvironment{abstract}{%
  \begin{flushleft}
    {\large \textbf{\abstractname}}\\
    \normalsize
}{%
  \end{flushleft}
}

\makeatother

\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}

\setlength\tabcolsep{1mm}
\renewcommand\arraystretch{1.3}
\renewcommand{\familydefault}{\sfdefault}

\renewcommand*{\headrulewidth}{0pt}
\pagestyle{fancy}

\newcounter{Table}
\renewcommand\theTable{\arabic{Table}}

% Page header height.
\setlength{\headheight}{4cm}

\fancyhf{}
%% Page Header
\lhead{
  \raisebox{-1.167cm}{\includegraphics[height=2.33cm]{figures/arrowhead}}
}
\rhead{%
  \vspace*{0.5cm}
  \renewcommand{\arraystretch}{0.75}
  \begin{tabular}{p{8.67cm} p{3.33cm}}
    \ifthenelse{\value{page}=1}{
      % Page header for first page.
      \tiny{Document title} & \tiny{Document type} \\
      \footnotesize{\textbf{\arrowtitle}} & \footnotesize{\textbf{\arrowtypeshort}} \\
      \tiny{Date} & \tiny{Version} \\
      \footnotesize{\textbf{\arrowdate}} & \footnotesize{\textbf{\arrowversion}} \\
      \tiny{Author\ifarrowauthormultiple{s}{}} & \tiny{Status} \\
      \footnotesize{\textbf{\arrowauthor}} & \footnotesize{\textbf{\arrowstatus}} \\
      \tiny{Contact} & \tiny{Page} \\
      \footnotesize{\textbf{\arrowcontact}} & \footnotesize{\textbf{\thepage \ (\pageref{LastPage})}}
    }{
      % Page header for remaining pages.
      \tiny{Document title} & \tiny{Version} \\
      \footnotesize{\textbf{\arrowtitle}} & \footnotesize{\textbf{\arrowversion}} \\
      \tiny{Date} & \tiny{Status} \\
      \footnotesize{\textbf{\arrowdate}} & \footnotesize{\textbf{\arrowstatus}} \\
      & \tiny{Page} \\
      & \footnotesize{\textbf{\thepage \ (\pageref{LastPage})}}
    }
  \end{tabular}%
}
%%

%% Page Footer
\lfoot{
  \rule[1pt]{\textwidth}{0.5pt}
  \scriptsize
  \arrowfooter
}
%%

%% Syntax Highlighting

% If you need more syntaxes than these, please add them to this document and
% contribute your additions to the Eclipse Arrowhead project.

%%% HTTP

\lstdefinelanguage{HTTP}{
  morekeywords={CONNECT,DELETE,GET,HEAD,OPTIONS,PUT,POST,PATCH,HTTP,HTTPS},
  sensitive=false,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/}, % s is for start and end delimiter
  morestring=[b]"
}

\lstset{%
  language=HTTP,
  backgroundcolor=\color{white},
  basicstyle=\ttfamily\bfseries\footnotesize\color{ArrowheadGrey},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  commentstyle=\mdseries,
  extendedchars=true,
  frame=single,
  keepspaces=true,
  keywordstyle=\color{ArrowheadBlue},
  numbers=left,
  numbersep=1em,
  numberstyle=\tiny\color{ArrowheadGrey},
  rulecolor=\color{gray!33},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  stringstyle=\color{ArrowheadPurple},
  tabsize=4,
  aboveskip=3ex,
  belowskip=2ex,
}

%%% ABNF

\lstdefinelanguage{ABNF}{
  otherkeywords={=,/},
  morekeywords={alpha,digit},
  sensitive=false,
  morecomment=[l]{;},
  morestring=[b]"
}

\lstset{%
  language=ABNF,
  backgroundcolor=\color{white},
  basicstyle=\ttfamily\bfseries\footnotesize\color{ArrowheadGrey},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  commentstyle=\mdseries,
  extendedchars=true,
  frame=single,
  keepspaces=true,
  keywordstyle=\color{ArrowheadBlue},
  numbers=left,
  numbersep=1em,
  numberstyle=\tiny\color{ArrowheadGrey},
  rulecolor=\color{gray!33},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  stringstyle=\color{ArrowheadPurple},
  tabsize=4,
  aboveskip=3ex,
  belowskip=2ex,
}