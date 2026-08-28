%% Clean, ATS-friendly academic resume class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/08/28 Polished academic resume]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Typography and page geometry
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{microtype}
\RequirePackage[
  letterpaper,
  left=0.68in,
  right=0.68in,
  top=0.58in,
  bottom=0.62in
]{geometry}

% Layout utilities
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{needspace}
\RequirePackage{fancyhdr}
\RequirePackage{csquotes}
\RequirePackage{iftex}
\RequirePackage{hyperref}

% Preserve searchable, copyable text in pdfLaTeX output.
\ifPDFTeX
  \input{glyphtounicode}
  \pdfgentounicode=1
\fi

% Restrained, print-friendly palette.
\definecolor{ResumeBlue}{HTML}{174A6E}
\definecolor{ResumeInk}{HTML}{17212B}
\definecolor{ResumeGray}{HTML}{56616B}
\definecolor{ResumeRule}{HTML}{B9C7D2}

\hypersetup{
  colorlinks=true,
  urlcolor=ResumeBlue,
  linkcolor=ResumeBlue,
  citecolor=ResumeBlue,
  pdfauthor={Mingyue Xu},
  pdftitle={Mingyue Xu - Resume},
  pdfsubject={Academic research resume}
}
\urlstyle{same}

% Global rhythm
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\fontsize{8}{9}\selectfont\color{ResumeGray}\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\footskip}{14pt}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\tabcolsep}{0pt}
\setlength{\emergencystretch}{1em}
\raggedbottom
\raggedright

% Section hierarchy
\titleformat{\section}
  {\color{ResumeBlue}\fontsize{11}{13}\selectfont\bfseries}
  {}
  {0pt}
  {\MakeUppercase}
  [\vspace{1.5pt}\color{ResumeRule}\titlerule]
\titlespacing*{\section}{0pt}{9pt}{5pt}

% Header helpers
\newcommand{\resumeDivider}{%
  \hspace{0.55em}\textcolor{ResumeRule}{|}\hspace{0.55em}%
}

% Reusable entry layout
\newenvironment{resumeEntries}{%
  \begin{itemize}[
    leftmargin=0pt,
    label={},
    itemsep=5pt,
    topsep=0pt,
    parsep=0pt,
    partopsep=0pt
  ]%
}{%
  \end{itemize}%
}

\newcommand{\resumeEntry}[4]{%
  \item
  \begin{tabularx}{\linewidth}[t]{@{}>{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}p{0.38\linewidth}@{}}
    \textbf{#1} & {\small\color{ResumeGray} #2} \\[-1pt]
    \textit{#3} & {\small\color{ResumeGray} #4}
  \end{tabularx}%
}

\newcommand{\resumeEntryFull}[2]{%
  \item
  \textbf{#1}\par\vspace{1pt}
  \textit{#2}%
}

\newcommand{\resumeAward}[3]{%
  \item
  \begin{tabularx}{\linewidth}[t]{@{}>{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}p{0.16\linewidth}@{}}
    \textbf{#1} & {\small\color{ResumeGray} #2} \\[-1pt]
    \multicolumn{2}{@{}l@{}}{\textit{#3}}
  \end{tabularx}%
}

\newcommand{\resumeDetail}[1]{%
  \par\vspace{1pt}\hspace{0.8em}{\small\color{ResumeGray}#1}\par\vspace{-1pt}%
}

\newcommand{\resumeHighlight}[1]{\textbf{\color{ResumeBlue}#1}}

% Compact, numbered publication entries with a hanging indent.
\newcounter{publication}
\newcommand{\cvpub}[1]{%
  \stepcounter{publication}%
  \Needspace{2.4\baselineskip}%
  \par\noindent
  \begingroup
    \small
    \hangindent=2.25em
    \hangafter=1
    \makebox[2.25em][l]{\color{ResumeGray}\textbf{[\arabic{publication}]}}#1\par
  \endgroup
  \vspace{3.2pt}%
}
