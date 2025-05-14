\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{replab}[2022/12/20 v1.0]

% --- Configuración básica ---

\LoadClass[11pt, letterpaper, twoside, twocolumn]{article}

% Configuración de idioma
\RequirePackage[english, spanish, mexico, es-noitemize, es-noindentfirst, ]{babel}

% Matemáticas avanzadas
\RequirePackage[tbtags]{mathtools}% Funciones matemáticas avanzadas (carga amsmath internamente)
\RequirePackage{amssymb, amsthm, siunitx}% Funciones matemáticas adicionales y unidades del SI
\RequirePackage[nolimits]{cmupint}% Integrales rectas

% Configuración de fuente
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\renewcommand{\ttdefault}{lmtt}% Fuente mono
\renewcommand{\rmdefault}{lmr}% Fuente serif
\renewcommand{\sfdefault}{lmss}% Fuente sans-serif

% Diseño del documento
\RequirePackage[margin=.8in, headheight=23pt, headsep=\baselineskip, twocolumn]{geometry}
\RequirePackage[pdfusetitle, colorlinks]{hyperref}
\RequirePackage[shortlabels, inline]{enumitem}
\RequirePackage[titles]{tocloft}
\RequirePackage{tabularx, fancyhdr, tabularray, titlesec, apptools, abstract, xcolor, xpatch, calc, etoolbox, abstract}
\usepackage{setspace}
\usepackage{etoolbox}

\newcolumntype{Y}{>{\centering\arraybackslash}X}

% Gráficos
\RequirePackage{graphicx, pdfpages, pdflscape, pgfplots, tcolorbox, graphbox}
\RequirePackage[outline]{contour}
\RequirePackage[hang, labelfont=bf, labelsep=period, margin=0.3cm, skip=3pt]{caption}
\RequirePackage{subcaption}

%[figurename=Fig.]{caption} Cambiar Figura.

% Bibliografía
\RequirePackage[backend=biber,bibstyle=apa,citestyle=numeric-comp,sorting=none]{biblatex}
\RequirePackage[style=mexican]{csquotes}

% --- Configuraciones adicionales de paquetes ---

% Versión de PGFplots
\pgfplotsset{compat=newest}

% Librerías de pgfplots
\usepgfplotslibrary{colormaps}
\usepackage{pgfplotstable}

% Librerías de tikz
\usetikzlibrary{babel, calc, scopes, intersections, angles, quotes, arrows, arrows.meta, backgrounds, shapes.geometric, patterns, shadows, perspective, external}

% Definición de estilos de Tikz, etc.
\tikzset{%
	% Configuraciones de tikz particulares del documento, como estilos de nodos y dibujos
	font = {\selectfont},
	frame/.style={thin, dashed, lightgray, line cap=round, rounded corners=5pt}
}

% Grosor de contorno adicional (para emplearse en gráficos)
\contourlength{1pt}

% Directorios de gráficos
\graphicspath{{imágenes/}{escudos/}}

% Todos los enlaces del documento en negro
\hypersetup{allcolors=black}

% Librerías de tabularray
\UseTblrLibrary{booktabs}
\UseTblrLibrary{amsmath}

% --- Configuraciones adicionales de diseño ---

% Colores
\definecolor{principaluno}{HTML}{000000}% Negro
\definecolor{principaldos}{HTML}{EAEDEF}% Gris claro
\definecolor{secuno}{HTML}{0897D5}% Azul claro
\definecolor{secdos}{HTML}{E8442A}% Naranja
\definecolor{sectres}{HTML}{7F9297}% Gris oscuro
\definecolor{seccuatro}{HTML}{F6F7F7}% Casi blanco

% Diseño de títulos de sección
\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection.}{1ex}{\color{principaluno}}

\titleformat{\subsection}
{\normalfont\large\bfseries}{\thesubsection.}{1ex}{\color{principaluno}}

\titleformat{\subsubsection}
{\normalsize\bfseries}{\thetitle.}{\widthof{\enspace}}{\normalsize\color{principaluno}}

\AtAppendix{%
    \titleformat{\section}[block]
    {\centering\normalfont\Large\bfseries}{\appendixname\ \thesection.}{1ex}{\color{principaluno}}
}

% Listas personalizadas
\setlist[enumerate, 1]{%
	label={\textbf{\color{principaluno}\arabic*.}},
	ref=\textbf{\arabic*}
}
\setlist[enumerate, 2]{%
	label={\textbf{\color{principaluno}(\alph*)}},
	ref=\textbf{(\alph*)}
}
\setlist[enumerate, 3]{%
	label={\color{principaluno}\roman*.},
	ref=\roman*
}

\setlist[itemize, 1]{%
	label={\color{principaluno}\textbullet},
}
\setlist[itemize, 2]{%
	label={\color{principaluno}--},
}
\setlist[itemize, 3]{%
	label={\color{principaluno}*},
}

% Redefinición de "y otros" en la bibliografía
\DefineBibliographyStrings{spanish}{andothers={et~al\adddot}}

% Tokens para llenar el documento
\newtoks\subtitle
\newtoks\subject
\newtoks\email

% Personalización del título de tablas largas con tabularray
\NewTblrTheme{replab}{
	\SetTblrStyle{caption-tag}{font=\bfseries}
	\DefTblrTemplate{caption-sep}{default}{\bfseries.\enskip}
}

% --- Página de título de documento ---
\makeatletter
	\renewcommand\maketitle{%

    	\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    	\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    	\long\def\@makefntext##1{\parindent 1em\noindent
    			\hb@xt@1.8em{%
    			  \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    
\begin{center}%
	\bigskip
    	\begin{tblr}{colspec={Q[c, b, wd=.6\textwidth]}}
    		{\bfseries\large\textcolor{principaluno}{\@title} \\ \LARGE\the\subtitle}
    	\end{tblr}

		\smallskip
    		
    
    % --- Opción para un solo autor (predeterminada) ---
    
			\begin{center}
				\@author\\
				\href{mailto:zahidmedrano@ciencias.unam.mx}{\footnotesize\color{principaluno}\texttt{zahidmedrano@ciencias.unam.mx}}
				{\footnotesize\the\email}
			\end{center}
    
    % --- Opción para dos autores ---
    
            % \begin{tabular}{c@{\hspace{3em}}c}
            %	Medrano Flores Zahid & Santiago Gallegos Daniel \\ 
            %	\href{mailto:zahidmedrano@ciencias.unam.mx}{\footnotesize\color{principaluno}\texttt{zahidmedrano@ciencias.unam.mx}} & \href{mailto:daniel_santiago07@ciencias.unam.mx}{\footnotesize\color{principaluno}\texttt{daniel\_santiago07@ciencias.unam.mx}} \\
            %	\includegraphics[width=0.2\linewidth]{fcunam} & \includegraphics[width=0.2\linewidth]{unam} \\
            % \end{tabular}
    
    % --- Opción para tres autores ---

			%\begin{center}
            %\begin{tabular}{c@{\hspace{2cm}}c@{\hspace{2cm}}c}
            %    Nombre 1 & Nombre 2 & Nombre 3 \\
            %    Información 1 & Información 2 & Información 3
				%\includegraphics[width=0.16\linewidth]{fcunam} & 
				%\includegraphics[width=0.16\linewidth]{unam} & 
				%\includegraphics[width=0.16\linewidth]{fcunam} \\
            % \end{tabular}
			%\end{center}
    
    % --- Opción para cuatro autores ---

            % \begin{tabular}{c@{\hspace{3em}}c}
            %     Nombre del autor 1\thanks{Información adicional del primer autor.} & Nombre del autor 2\thanks{Información adicional del segundo autor.} \\ 
            %     \href{mailto:emailautor1@email.com}{\footnotesize\color{principaluno}\texttt{emailautor1@email.com}} & \href{mailto:emailautor2@email.com}{\footnotesize\color{principaluno}\texttt{emailautor2@email.com}} \\[10pt]
            %     Nombre del autor 3\thanks{Información adicional del tercer autor.} & Nombre del autor 4\thanks{Información adicional del cuarto autor.} \\
            %     \href{mailto:emailautor3@email.com}{\footnotesize\color{principaluno}\texttt{emailautor3@email.com}} & \href{mailto:emailautor4@email.com}{\footnotesize\color{principaluno}\texttt{emailautor4@email.com}}
            % \end{tabular}

			\smallskip
    		\the\subject. \\ 
			Facultad de Ciencias. UNAM.	Semestre 2025-2.
    
        \end{center}
    
        \thispagestyle{empty}
    
	}
\makeatother

% Rediseño del estilo plain
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	
	\fancyhf{}
	\fancyfoot[c]{%
		\begin{tblr}{c c c}
			\textcolor{principaluno}{$\boldsymbol{-}$}
			& \thepage &
			\textcolor{principaluno}{$\boldsymbol{-}$}
		\end{tblr}
	}
}



% Diseño de los encabezados y pies de página
\fancypagestyle{fancy}{%
    \xpretocmd\headrule{\color{principaluno}}{}{\PatchFailed}% Cambio de color de la regla en el encabezado
    
    \fancyhf{}
    \fancyhead[le]{%
    	\begin{tblr}{
			colspec = {Q[c,m] Q[l,m]},
			colsep = 2pt
		}
    		\includegraphics[
				align=c,
				width=3ex]{fcunam}% Escudo de la instittución
    		& {\small{Facultad de Ciencias UNAM}}
    	\end{tblr}
    }
    \fancyhead[re]{%
    	\small\textit{Introducción a la Ciencia de Datos}% Nombre de la asignatura
    }
    
    \fancyhead[co]{%
        \begin{tblr}{c c c}
            \phantom{\includegraphics[width=3ex]{fcunam}} & \small\textit{\the\subtitle} & \phantom{\includegraphics[width=3ex]{fcunam}}
        \end{tblr}
    }
    
    \fancyfoot[c]{%
    	\begin{tblr}{c c c}
    		\textcolor{principaluno}{$\boldsymbol{-}$}
    		& \thepage &
    		\textcolor{principaluno}{$\boldsymbol{-}$}
    	\end{tblr}
    }
}

% --- Comandos de mate adicionales ---

\newcommand{\pqty}[1]{%
    \left( #1 \right)
}

\newcommand{\bqty}[1]{%
    \left[ #1 \right]
}

\newcommand{\Bqty}[1]{%
    \left\lbrace #1 \right\rbrace
}

\newcommand{\abs}[1]{%
    \left\lvert #1 \right\rvert
}

\newcommand{\norm}[1]{%
    \left\lvert\left\lvert #1 \right\rvert\right\rvert
}

\newcommand{\rtwovec}[2]{% Vectores columna en R^2 
	\begin{bmatrix*}[r]
		#1 \\ #2 
	\end{bmatrix*}
}

\newcommand{\rthreevec}[3]{% Vectores columna en R^3
	\begin{bmatrix*}[r]
		#1 \\ #2 \\ #3
	\end{bmatrix*}
}

\newcommand{\bvec}[1]{% Vectores
	\mathbf{#1}
}

\newcommand{\uvec}[1]{% Vectores unitarios (con gorrito)
	\textbf{\^{#1}}
}

\newenvironment{amatrix}[2]{% Matices aumentadas
	\left[\begin{array}{@{}*{#1}{r}|*{#2}{r}@{}}
	}%
	{
	\end{array}\right]
}