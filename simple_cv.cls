% Created by Johannes Brust
% Originally based on Murat Can Karacabey's LaTeX CV:
%   (https://github.com/muratcankaracabey/latex_cv)
% My version doesn't require LuaLaTeX (I use pdflatex) and the font used
% is Roboto Thin (https://tug.org/FontCatalogue/robotothin/).
\author{Johannes Brust}
\RequirePackage[dvipsnames]{xcolor}
\LoadClass[11pt]{article}
\ProvidesClass{simple_cv}
\RequirePackage[ngerman]{babel} % Set to german (also switches the date format)
\RequirePackage[sfdefault,thin]{roboto} % Set Roboto Thin font
\RequirePackage[T1]{fontenc}            % Set Roboto Thin font
\RequirePackage{titlesec} % Alter section title style
\RequirePackage{tikz}
\RequirePackage[left=2cm,top=0.75cm,right=2cm,bottom=1.5cm]{geometry}
\RequirePackage{hyperref}
\RequirePackage{longtable} % Table supporting page breaks
\RequirePackage{enumitem} % Remove space between list items
\setlist{nosep}           % Remove space between list items

% Set page number font size:
\renewcommand*{\thepage}{\footnotesize\arabic{page}}

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}

\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
}

% Header
\newcommand\headerview{
\begin{minipage}{0.45\linewidth}
    \center \name \\[0.05cm] 
    \contact
\end{minipage}%
\hfill
\begin{minipage}{0.25\linewidth}
    \profpic{3.5cm}{images/profilpicture}
\end{minipage}
}

% Profile picture
\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[width=#1]{#2}}% 
    \tikz\node [draw, circle,%
    line width=4pt, color=white,% 
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)% 
    {\usebox{\picbox}};}]% 
    {};}
    

\newcommand{\name}{%
    {\large \@firstname \ \@lastname}
}

\newcommand{\contact}{%
        {\small \@address  \\%
        \@mobile \\%
        \@mail \\%
        } % 
}

% A trick to put the line with <before> parameter in \titleformat:
\newcommand\ruleafter[1]{#1~{\hrulefill}}

% Customise the \section command:
\titleformat{\section}
    % Make the \section headers large (\large) and bold (\bfseries):
    {\large\bfseries} 
    % Can be used to give a prefix to all sections, like 'Section ...':
    {}{0em}
    {\ruleafter}

\titlespacing*{\section}{-1pt}{0.3cm}{0pt}

\newcommand\close[1]{
    \vspace{1cm}
    \includegraphics[width=4cm]{images/signature.png}\newline
    #1, \today
}