% report / workpackage format based on an older format 20150511
%CJ Willers neliswillers@gmail.com 083-259-0033

% one template with consistent look and feel
% only front matter is different between the two templates.

%http://www.howtotex.com/packages/9-essential-latex-packages-everyone-should-use/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{halconrep}[2020/12/09 Report/Workpackage single footer report style]

\newcommand{\thisisHalconclass}{true}

\newcommand{\setupworkpackage}{false}
\DeclareOption{workpackage}{\renewcommand{\setupworkpackage}{true}}
\ProcessOptions\relax

\LoadClass[10pt,a4paper,oneside,openany]{memoir}

\usepackage{morewrites} % must be be near the top of usepackage
\usepackage{tcolorbox} % for TBC
\usepackage{xcolor}
\definecolor{incoblue}{rgb}{0,0.39,0.61}

\usepackage{changepage}
\usepackage{colortbl} 

%  support only pdf build procedures
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage[protrusion=true,expansion=true]{microtype} % only works in pdflatex mode

\usepackage[english]{babel}
\usepackage{etoolbox}% http://ctan.org/pkg/etoolbox
\usepackage{xparse} %parse the doc changes file
\usepackage{ifthen}
\usepackage{lastpage}
%\usepackage[scaled=1.0]{helvet} % use sanserif font
\usepackage[scaled=1.0]{uarial} % supposed to the Arial

\usepackage[absolute,overlay]{textpos}


% use the acronym package but without boldface
\usepackage[printonlyused]{acronym}
\renewcommand*\aclabelfont[1]{\textnormal{\acsfont{#1}}}
\newcommand{\acrofirstcolwidth}{AAAAAAAAAAAAAAAA}

% force line breaks on long urls
% http://tex.stackexchange.com/questions/54946/how-to-break-long-url-in-an-item
\usepackage[hyphenbreaks]{breakurl}
\usepackage[hyphens]{url}
\renewcommand\familydefault{\sfdefault} % use sanserif font
\usepackage[T1]{fontenc}
\usepackage{listliketab}

%\usepackage{tgtermes} % this time roman font
%\usepackage{zref} %required by enumitem-zref
%\usepackage{zref-base}[2010/10/22]
%    \makeatletter
%    \let\zref@addprop\zref@addprops
%    \makeatother
\usepackage{enumitem} %improved control over enumerate and itemize
%\usepackage{enumitem-zref} %reference list items
\usepackage{color}
\usepackage{rotating}%rotate pages
\usepackage{longtable}%mulitple pages
\usepackage{url}%handle urls better
\usepackage{afterpage} % afterpage{\clearpage}
\usepackage{placeins} % FloatBarrier
\usepackage{pstool}
\usepackage{comment}
\usepackage{listings} % get nice listings
\usepackage{ragged2e} % fully justify
\usepackage[detect-weight,detect-all=true]{siunitx} % nice! SI units and print numbers
\usepackage{gensymb} % get the degree symbol as in \celcius
\usepackage{bm} % get bold face math symbols
\usepackage[normalem]{ulem}%for strikeout test, but retain italics for emph
\usepackage{textcomp} % additional fonts, required for upquote in listings and \textmu
%\usepackage{tabu} % not used any more! must be loaded late, tabular with different line widths

\usepackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{-}

\usepackage{pdflscape}


% using biblatex
%The bibliography is done with biblatex.  The config is give as options:
%\usepackage[backend=biber,sortcites,sorting=none,defernumbers]{biblatex}
%using biber, sort the citations in the doc, entries in order of appearance
%defernumbers cause the controlled docs to be numbered first.
% the name alias means that surname first before initials.
% names are only initials, give up to three names
\usepackage[backend=biber,sortcites,sorting=nyt,defernumbers,giveninits=true,maxbibnames=9,maxcitenames=4,mincitenames=3,hyperref=true,firstinits=true,]{biblatex}
\DeclareNameAlias{author}{last-first}
\usepackage{biblatex-ext-tabular}


\usepackage{xr-hyper}
\usepackage{hyperref} % must be near-last, after other usepackages
% the following shows hyperlinks in black with underline
% it does not work in all PDF readers, works in Foxit.
\hypersetup{colorlinks=false,pdfborderstyle={/S/U/W 1},pdfborder=0 0 1}

% set up for wp or report
\ifthenelse{\equal{\setupworkpackage}{true}}%
{% set up for work package	
\newcommand{\DocType}{Work Package}
}%
{% set up for report
\newcommand{\DocType}{Report}
}

%the following is required for carriage return symbol
%ftp://ftp.botik.ru/rented/znamensk/CTAN/fonts/mathabx/texinputs/mathabx.dcl
%https://secure.kitserve.org.uk/content/mathabx-font-symbol-redefinition-clash-latex
\DeclareFontFamily{U}{mathb}{\hyphenchar\font45}
\DeclareFontShape{U}{mathb}{m}{n}{
      <5> <6> <7> <8> <9> <10> gen * mathb
      <10.95> mathb10 <12> <14.4> <17.28> <20.74> <24.88> mathb12
      }{}
\DeclareSymbolFont{mathb}{U}{mathb}{m}{n}
\DeclareMathSymbol{\dlsh}{3}{mathb}{"EA}

% this is how much the body text must indent
\newlength{\localtextwidth}  \setlength{\localtextwidth}{170.5mm}
\newlength{\localtextwidthnarrow}  \setlength{\localtextwidthnarrow}{150.5mm} % indented by 20 mm
\newlength{\localspine}  \setlength{\localspine}{19.7mm}
\newlength{\localspinewide}  \setlength{\localspinewide}{39.7mm}
\newlength{\localtextindent}\setlength{\localtextindent}{20mm}

\newlength{\abbrevitemssep}\setlength{\abbrevitemssep}{0pt}

% set up the page size
% make stock size the same as trimsize
\settrimmedsize{297mm}{210mm}{*}
\setlength{\trimedge}{\stockwidth}
\addtolength{\trimedge}{-\paperwidth}
\setlength{\trimtop}{0mm}
\setlength{\uppermargin}{29mm}

\setlength{\spinemargin}{\localspine}

\setlength{\headheight}{14.4mm}
\setlength{\headsep}{4.6mm}

\setlength{\textwidth}{\localtextwidth}  
\setlength{\textheight}{219.1mm} % initially for title page
\setlength{\footskip}{6.27mm}

\setlength{\normalrulethickness}{0.4pt}
\setlength{\parskip}{2mm}
\setlength{\parindent}{0.pt}

\setlrmargins{\spinemargin}{*}{*}
\checkandfixthelayout[lines]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makelscapebodywidth}{
\clearpage
\settypeblocksize{222mm}{\localtextwidth}{}
% \setlength{\textwidth}{\localtextwidthnarrow}  
% \setlength{\spinemargin}{\localspinewide}
\setlrmargins{20mm}{*}{*}
\checkandfixthelayout[lines]

% format section and lower headings
\setsecindent{-\localtextindent}
\setsubsecindent{-\localtextindent}
\setsubsubsecindent{-\localtextindent}
\setparaindent{-\localtextindent}
\setsubparaindent{-\localtextindent}
\setafterparaskip{1ex}
\setaftersubparaskip{1ex}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makelocalbodywidth}{
  \clearpage
  \settypeblocksize{240mm}{\localtextwidth}{}
\setlength{\textwidth}{\localtextwidthnarrow}  
\setlength{\spinemargin}{\localspinewide}
\setlrmargins{\spinemargin}{*}{*}
\checkandfixthelayout[lines]

% format section and lower headings
\setsecindent{-\localtextindent}
\setsubsecindent{-\localtextindent}
\setsubsubsecindent{-\localtextindent}
\setparaindent{-\localtextindent}
\setsubparaindent{-\localtextindent}
\setafterparaskip{1ex}
\setaftersubparaskip{1ex}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makelocalfrontwidth}{
%\setlength{\lowermargin}{16pt}  
\setlength{\textwidth}{\localtextwidth}  
\setlength{\spinemargin}{\localspine}
\setlrmargins{\spinemargin}{*}{*}
\settypeblocksize{\textheight}{\localtextwidth}{*}\setulmarginsandblock{\uppermargin}{17mm}{*}
\checkandfixthelayout[lines]
% format section and lower headings
\setsecindent{0pt}
\setsubsecindent{0pt}
\setsubsubsecindent{0pt}
\setparaindent{0pt}
\setsubparaindent{0pt}
\setafterparaskip{1ex}
\setaftersubparaskip{1ex}}

\makelocalfrontwidth

\newlength{\mydocrulewidth}  \setlength{\mydocrulewidth}{0.pt}
\newlength{\npchaprulethick} \setlength{\npchaprulethick}{2pt}
\newlength{\npchapruleskip} \setlength{\npchapruleskip}{-3.3mm}
\newlength{\tocftruleskip} \setlength{\tocftruleskip}{-5mm}

%font size, font exp, raisebox, boxheight, boxwidth, hspace, text
%\setwptext{10}{12}{-0.8ex}{6mm}{0.14\textwidth}{\hspace{1mm}}{ABSTRACT}&%
\newcommand{\setwptextUpper}[7]{\fontsize{#1}{#2}\selectfont\bfseries\raisebox{#3}{\parbox[b][#4][c]{#5}{#6\MakeUppercase{#7}}}}
\newcommand{\setwptext}[7]{\fontsize{#1}{#2}\selectfont\bfseries\raisebox{#3}{\parbox[b][#4][c]{#5}{#6#7}}}
\newcommand{\setwptextNoBold}[7]{\fontsize{#1}{#2}\selectfont\raisebox{#3}{\parbox[b][#4][c]{#5}{#6#7}}}

\renewcommand*{\arraystretch}{1.3}

% the width of the box holding the chap/sec number
\newlength{\secnumwidth}
\setlength{\secnumwidth}{\localtextindent}
\makeatletter
\renewcommand{\@seccntformat}[1]{\makebox[\secnumwidth][l]{\csname the#1\endcsname}}
\makeatother

\renewcommand*{\appendixname}{Appendix}

% chapters in the body: define the chapter and section formatting
\makechapterstyle{docChapterstyle}{%
\renewcommand{\chaptitlefont}{\fontsize{14}{14}\selectfont\bfseries\sffamily}
\renewcommand{\chapnumfont}{\chaptitlefont}
\renewcommand{\chapnamefont}{\chaptitlefont}
\setlength{\chapindent}{\secnumwidth}
\setlength{\afterchapskip}{0mm} % space between chapter heading and text default 40 pt
\setlength{\beforechapskip}{0mm} % space before chapter heading  default 50 pt
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}
\renewcommand*{\printchapternum}{\noindent\llap{\makebox[\chapindent][l]{\chapnumfont \thechapter.}}}
\renewcommand{\afterchapternum}{} %  no period after chapter heading in body
\renewcommand{\cftchapteraftersnum}{}% no  period after chapter heading in toc
\renewcommand{\printchaptertitle}[1]{\begingroup\chaptitlefont\MakeTextUppercase{##1}\endgroup}
}

% chapters in the header: define the chapter and section formatting
\makechapterstyle{headChapterstyle}{%
\renewcommand{\chaptitlefont}{\fontsize{16}{16}\selectfont\bfseries\sffamily}
\renewcommand{\chapnumfont}{\chaptitlefont}
\renewcommand{\chapnamefont}{\chaptitlefont}
\setlength{\chapindent}{\secnumwidth}
\setlength{\afterchapskip}{0mm} % space between chapter heading and text default 40 pt
\setlength{\beforechapskip}{-5mm} % space before chapter heading  default 50 pt
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}
\renewcommand*{\printchapternum}{{\makebox[\chapindent][l]{\chapnumfont \thechapter}}}
\renewcommand{\afterchapternum}{} %  no period after chapter heading in body
\renewcommand{\cftchapteraftersnum}{}% no  period after chapter heading in toc
\renewcommand{\printchaptertitle}[1]{\begingroup\chaptitlefont\centering\MakeTextUppercase{##1}\\[\npchapruleskip]\rule{\textwidth}{\npchaprulethick}\endgroup}
}

% command to make front matter unnumbered chapter, shown in toc or not shown in toc
\newcommand{\fmchaptertoc}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{#1}}{}}}
\newcommand{\fmchapter}[1]{\chapter*{#1}}




% https://perspectivesandprotips.blogspot.com/2014/10/uppercasing-in-memoir-table-of-contents.html
\makeatletter
\settocpreprocessor{part}{%
    \let\tempf@rtoc\f@rtoc%
    \def\f@rtoc{%
      \texorpdfstring{\MakeTextUppercase{%
        \tempf@rtoc}%
      }{\tempf@rtoc}%
    }% 
}
\settocpreprocessor{chapter}{%
    \let\tempf@rtoc\f@rtoc% 
    \def\f@rtoc{%
      \texorpdfstring{\MakeTextUppercase{%
        \tempf@rtoc}%
      }{\tempf@rtoc}%
    }% 
}
\makeatother

\setlength\beforechapskip{-\baselineskip}
\setlength\afterchapskip{2ex plus -0.5ex minus -.2ex}

\setsecheadstyle{\bfseries\Large}
\setbeforesecskip{-3.5ex plus -1ex minus -.2ex}

\setsubsecheadstyle{\bfseries\large}
\setbeforesubsecskip{-3.25ex plus -1ex minus -.2ex}

\setsubsubsecheadstyle{\bfseries\normalsize}
\setbeforesubsubsecskip{-3.25ex plus -1ex minus -.2ex}

\setparaheadstyle{\bfseries\normalsize}
\setbeforeparaskip{-3.25ex plus -1ex minus -.2ex}

\setsubparaheadstyle{\bfseries\normalsize}
\setbeforesubparaskip{-3.25ex plus -1ex minus -.2ex}

\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{2}

%contents, figures and tables
\addto\captionsenglish{\renewcommand{\contentsname}{CONTENTS}}
\addto\captionsenglish{\renewcommand{\listfigurename}{FIGURES}}
\addto\captionsenglish{\renewcommand{\listtablename}{TABLES}}
\renewcommand{\cftchapterdotsep}{.5}
\renewcommand{\cftsectiondotsep}{.5}
\renewcommand{\cftsubsectiondotsep}{.5}
\renewcommand{\cftsubsubsectiondotsep}{.5}
\renewcommand{\cftparagraphdotsep}{.5}
\renewcommand{\cftfiguredotsep}{.5}
\renewcommand{\cfttabledotsep}{.5}
\setpnumwidth{1.5em}
\setrmarg{1.5em}

\setlength{\cftchapternumwidth}{1.5em}% Set length of number width in ToC for \chapter
\setlength{\cftsectionnumwidth}{2.25em}% Set length of number width in ToC for \section
\setlength{\cftsubsectionnumwidth}{3.0em}% Set length of number width in ToC for \subsection
\setlength{\cftfigurenumwidth}{11mm}
\setlength{\cfttablenumwidth}{11mm}

% set up figure and table captions
\renewcommand{\cftfigurename}{Figure }
\renewcommand{\cfttablename}{Table }
\renewcommand{\cftappendixname}{}
\captionnamefont{\bfseries}
\captiontitlefont{\bfseries}
\captiondelim{: }

% tab/fig number in lot and lof
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand*{\cftfigureaftersnum}{:}
\renewcommand*{\cfttableaftersnum}{:}

%\renewcommand*{\printsecnum}{\noindent\llap{\makebox[\chapindent][l]{\chapnumfont \thechapter.}}}

%add the centering command to all floats
\makeatletter
\g@addto@macro \@floatboxreset \centering
\makeatother

%figure and table numbers run consecutively throughout document
%makeatletter
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
%\counterwithout{figure}{chapter}
%\counterwithout{table}{chapter}
%\counterwithout{equation}{chapter}
\makeatletter

\renewcommand{\insertchapterspace}{} % to remove space between chapters in lof lot
%\renewcommand*{\lotheadstart}{\vspace{0em}}
%\renewcommand{\afterlottitle}{\vspace{1em}}

%ultrablock style
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.3\baselineskip}
% line spacing
\OnehalfSpacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlink cross referencing between documents.
% remember to run the build process again at least once, 
% after all docs have been completed. This is to ensure that 
% all the links in all the docs are available for cross-linking.
%
% 1: is the symbolic name to the external document defined in the form
%    \externaldocument[symDoc-]{docName}, where symDoc- is the symbol used
%    to refer to the external doc, docName is the name of the PDF document
%    with no filename extensions.
% 2: is the symbolic label inside the external document to be referenced
% 3: is the type of reference in text like Section, Chapter, Figure, Table,
%   etc. This will be printed in the current doc as given.
% 4: is the bibtex cite reference to the external doc
\newcommand{\hrefcrosscitealt}[4]{\hyperref[#1#2]{\cite[{#3~\ref{#1#2}}]{#4}}}
\newcommand{\hrefcrosscite}[4]{#3~\hyperref[#1#2]{\ref{#1#2}} in \cite{#4}}
\newcommand{\hrefcrossref}[3]{#3~\hyperref[#1#2]{\ref{#1#2}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% user variables

\newcommand{\DocCompanyLogo}[1]{\renewcommand{\Doc@CompanyLogo}{#1}}
\newcommand{\Doc@CompanyLogo}{pic/halcon-logo.pdf}
\@onlypreamble{\DocCompanyLogo}

\newcommand{\DocProject}[1]{\renewcommand{\Doc@Project}{#1}}
\newcommand{\Doc@Project}{\ }
\@onlypreamble{\DocProject}

\newcommand{\DocSubject}[1]{\renewcommand{\Doc@Subject}{#1}}
\newcommand{\Doc@Subject}{\ }
\@onlypreamble{\DocSubject}

\newcommand{\DocTitle}[1]{\ifthenelse{\equal{#1}{}}{}{\renewcommand{\Doc@Title}{#1}}}
\newcommand{\Doc@Title}{}
\@onlypreamble{\DocTitle}

\ifthenelse{\equal{\setupworkpackage}{true}}%
{% title format for work package
\renewcommand{\Doc@Title}{\Doc@Project{} \DocType{}: \Doc@Subject}}
{ %  use DocTitle if not empty, else compound	
\ifthenelse{\equal{\Doc@Title}{}}%
{\renewcommand{\Doc@Title}{\Doc@Project{} \DocType{} for the \Doc@Subject}}%
{\renewcommand{\Doc@Title}{\DocTitle}}%
}

\newcommand{\DocClassification}[1]{\renewcommand{\Doc@Classification}{#1}}
\newcommand{\Doc@Classification}{\ }
\@onlypreamble{\DocClassification}

\newcommand{\DocDate}[1]{\renewcommand{\Doc@Date}{#1}}
\newcommand{\Doc@Date}{\ }
\@onlypreamble{\DocDate}

\newcommand{\DocEffecticeDate}[1]{\renewcommand{\Doc@EffecticeDate}{#1}}
\newcommand{\Doc@EffecticeDate}{\ }
\@onlypreamble{\DocEffecticeDate}

\newcommand{\DocRevision}[1]{\renewcommand{\Doc@Revision}{#1}}
\newcommand{\Doc@Revision}{\ }
\@onlypreamble{\DocRevision}

\newcommand{\DocNumber}[1]{\renewcommand{\Doc@Number}{#1}}
\newcommand{\Doc@Number}{\ }
\@onlypreamble{\DocNumber}

\newcommand{\DocApprovalOneName}[1]{\renewcommand{\Doc@ApprovalOneName}{#1}}
\newcommand{\Doc@ApprovalOneName}{}
\@onlypreamble{\DocApprovalOneName}

\newcommand{\DocApprovalOneTitle}[1]{\renewcommand{\Doc@ApprovalOneTitle}{#1}}
\newcommand{\Doc@ApprovalOneTitle}{}
\@onlypreamble{\DocApprovalOneTitle}

\newcommand{\DocApprovalOneDate}[1]{\renewcommand{\Doc@ApprovalOneDate}{#1}}
\newcommand{\Doc@ApprovalOneDate}{}
\@onlypreamble{\DocApprovalOneDate}

\newcommand{\DocApprovalTwoName}[1]{\renewcommand{\Doc@ApprovalTwoName}{#1}}
\newcommand{\Doc@ApprovalTwoName}{}
\@onlypreamble{\DocApprovalTwoName}

\newcommand{\DocApprovalTwoTitle}[1]{\renewcommand{\Doc@ApprovalTwoTitle}{#1}}
\newcommand{\Doc@ApprovalTwoTitle}{}
\@onlypreamble{\DocApprovalTwoTitle}

\newcommand{\DocAcceptanceOneName}[1]{\renewcommand{\Doc@AcceptanceOneName}{#1}}
\newcommand{\Doc@AcceptanceOneName}{}
\@onlypreamble{\DocAcceptanceOneName}

\newcommand{\DocAcceptanceOneTitle}[1]{\renewcommand{\Doc@AcceptanceOneTitle}{#1}}
\newcommand{\Doc@AcceptanceOneTitle}{}
\@onlypreamble{\DocAcceptanceOneTitle}

\newcommand{\DocAcceptanceTwoName}[1]{\renewcommand{\Doc@AcceptanceTwoName}{#1}}
\newcommand{\Doc@AcceptanceTwoName}{}
\@onlypreamble{\DocAcceptanceTwoName}

\newcommand{\DocAcceptanceTwoTitle}[1]{\renewcommand{\Doc@AcceptanceTwoTitle}{#1}}
\newcommand{\Doc@AcceptanceTwoTitle}{}
\@onlypreamble{\DocAcceptanceTwoTitle}

\newcommand{\DocAbstract}[1]{\renewcommand{\Doc@Abstract}{#1}}
\newcommand{\Doc@Abstract}{}
\@onlypreamble{\DocAbstract}

\newcommand{\DocConclusions}[1]{\renewcommand{\Doc@Conclusions}{#1}}
\newcommand{\Doc@Conclusions}{}
\@onlypreamble{\DocConclusions}
\newcommand{\hereDocConclusions}{\Doc@Conclusions}

\newcommand{\DocRecommendations}[1]{\renewcommand{\Doc@Recommendations}{#1}}
\newcommand{\Doc@Recommendations}{}
\@onlypreamble{\DocRecommendations}
\newcommand{\hereDocRecommendations}{\Doc@Recommendations}

\newcommand{\DocCopyright}[1]{\renewcommand{\Doc@Copyright}{#1}}
\newcommand{\Doc@Copyright}{\copyrighttext}
\@onlypreamble{\DocCopyright}

\newcommand{\DocAuthorOneName}[1]{\renewcommand{\Doc@AuthorOneName}{#1}}
\newcommand{\Doc@AuthorOneName}{}
\@onlypreamble{\DocAuthorOneName}

\newcommand{\DocAuthorTwoName}[1]{\renewcommand{\Doc@AuthorTwoName}{#1}}
\newcommand{\Doc@AuthorTwoName}{}
\@onlypreamble{\DocAuthorTwoName}

\newcommand{\DocAuthorThreeName}[1]{\renewcommand{\Doc@AuthorThreeName}{#1}}
\newcommand{\Doc@AuthorThreeName}{}
\@onlypreamble{\DocAuthorThreeoName}

\newcommand{\DocAuthorFourName}[1]{\renewcommand{\Doc@AuthorFourName}{#1}}
\newcommand{\Doc@AuthorFourName}{}
\@onlypreamble{\DocAuthorFourName}

\newcommand{\DocAuthorNames}%
{\Doc@AuthorOneName%
\ifthenelse{\equal{\Doc@AuthorTwoName}{}}{}{, \Doc@AuthorTwoName}%
\ifthenelse{\equal{\Doc@AuthorThreeName}{}}{}{, \Doc@AuthorThreeName}%
\ifthenelse{\equal{\Doc@AuthorFourName}{}}{}{, \Doc@AuthorFourName}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header footer commands
%https://purl.org/nxg/dist/textpos
%https://ftp.leg.uct.ac.za/pub/packages/ctan/macros/latex/contrib/textpos/textpos.pdf
%http://www.tug.org/TUGboat/tb23-3-4/tb75gray.pdf
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\absheadrule}{\begin{textblock}{170.5}(19.7,24.5)\rule{\textwidth}{\normalrulethickness}\end{textblock}}
\newcommand{\absheadlogo}{\begin{textblock}{1}(140.25,15.2)\noindent\raisebox{-4.8mm}[0pt][0pt]{\begin{minipage}[t]{50mm}\hfill\doLogo{\Doc@CompanyLogo}{37mm}\end{minipage}}\end{textblock}}
\newcommand{\absheadtitl}{\begin{textblock}{1}[0.5,0](80.5,13.3)\noindent\begin{minipage}[t][11.2mm][t]{50mm}\centering\fontsize{8pt}{8.5pt}\selectfont\MakeUppercase{\Doc@Title}\end{minipage}\end{textblock}}
 
\newcommand{\absfootrulebody}{\begin{textblock}{170.5}(19.7,272.5)\rule{\textwidth}{\normalrulethickness}\end{textblock}}
\newcommand{\absfootclassbody}{\begin{textblock}{0.1}[0.5,0](80.5,269.8)\begin{minipage}[t][11.2mm][t]{50mm}\centering\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries CLASSIFICATION:}\\[0.3mm]\MakeUppercase{\Doc@Classification}\end{minipage}\end{textblock}}
\newcommand{\absfootdocnumbody}{\begin{textblock}{50}[0,0](19.7,269.8)\begin{minipage}[t][11.2mm][t]{50mm}\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries DOCUMENT No.:}\\[0.3mm]\Doc@Number\ Issue \Doc@Revision\end{minipage}\end{textblock}}
\newcommand{\absfootpagnumbody}{\begin{textblock}{70}[1,0](190.5,269.8)\vbox{\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries PAGE:}\  \thepage\   of\   \pageref{LastPage}\\[0.3mm]\ }\end{textblock}}
 
\newcommand{\absfootrulefront}{\begin{textblock}{170.5}(19.7,278)\rule{\textwidth}{\normalrulethickness}\end{textblock}}
\newcommand{\absfootclassfront}{\begin{textblock}{0.1}[0.5,0](80.5,275.)\begin{minipage}[t][11.2mm][t]{50mm}\centering\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries CLASSIFICATION:}\\[0.3mm]\MakeUppercase{\Doc@Classification}\end{minipage}\end{textblock}}
\newcommand{\absfootdocnumfront}{\begin{textblock}{50}[0,0](19.7,275.)\begin{minipage}[t][11.2mm][t]{50mm}\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries DOCUMENT No.:}\\[0.3mm]\Doc@Number\ Issue \Doc@Revision\end{minipage}\end{textblock}}
\newcommand{\absfootpagnumfront}{\begin{textblock}{70}[1,0](190.5,275.)\vbox{\fontsize{8pt}{8.5pt}\selectfont\rule{0pt}{6.5mm}{\bfseries PAGE:}\  \thepage\   of\   \pageref{LastPage}\\[0.3mm]\ }\end{textblock}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % body page style
\newcommand{\ResetPage}[1]{
\makelocalfrontwidth
%headers and footers, start with empty page 
\copypagestyle{BodyPageStyle}{empty}
%https://tex.stackexchange.com/questions/67787/makeheadrule-in-the-memoir-class
\makerunningwidth{BodyPageStyle}[\localtextwidth]{\localtextwidth}

\ifthenelse{\equal{#1}{frontmatter}}%
{% front matter
\makeoddfoot{BodyPageStyle}{\absfootrulefront\absfootdocnumfront}{\absfootclassfront}{\absfootpagnumfront}
\makeevenfoot{BodyPageStyle}{\absfootrulefront\absfootdocnumfront}{\absfootclassfront}{\absfootpagnumfront}
}%
{% body
\makeoddfoot{BodyPageStyle}{\absfootrulebody\absfootdocnumbody}{\absfootclassbody}{\absfootpagnumbody}
\makeevenfoot{BodyPageStyle}{\absfootrulebody\absfootdocnumbody}{\absfootclassbody}{\absfootpagnumbody}
}

\makeoddhead{BodyPageStyle}{\absheadrule}{\absheadtitl}{\absheadlogo}
\makeevenhead{BodyPageStyle}{\absheadrule\absfootrulebody}{\absheadtitl}{\absheadlogo}

\aliaspagestyle{chapter}{BodyPageStyle}
\aliaspagestyle{plain}{BodyPageStyle}
\aliaspagestyle{empty}{BodyPageStyle}

\pagestyle{BodyPageStyle}

\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test if logo is empty, else make picture
\newcommand{\doLogo}[2]{\ifthenelse{\equal{#1}{}}{}{\resizebox{#2}{!}{\includegraphics{#1}}}}

%title pages layout
%\setulmargins{24.267mm}{*}{*} % \uppermargin
\checkandfixthelayout[lines]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\TitlePage}{
\newlength{\titlepageaddressskip}\setlength{\titlepageaddressskip}{0.3mm}
\ResetPage{frontmatter}

\chapterstyle{headChapterstyle}

\copypagestyle{TitlePageStyle}{empty}
\makerunningwidth{TitlePageStyle}[\localtextwidth]{\localtextwidth}
\makeoddhead{TitlePageStyle}{}{}{}
\makeevenhead{TitlePageStyle}{}{}{}
\makeoddfoot{TitlePageStyle}{}{}{}
\makeevenfoot{TitlePageStyle}{}{}{}
\aliaspagestyle{titlingpagestyle}{TitlePageStyle}
\aliaspagestyle{titlingpage}{TitlePageStyle}
\aliaspagestyle{title}{TitlePageStyle}

\begin{titlingpage*} 
\centering
\vspace*{-2.7mm}
\hspace{-0.5mm}\doLogo{\Doc@CompanyLogo}{90mm}
\ \\
\vspace*{35.7mm}
{\centering
\begin{minipage}[t][100mm][t]{120mm}
\centering
{\fontsize{18}{20} \selectfont\ \bfseries\MakeUppercase{\Doc@Title}\par }%
\vfill
\end{minipage}
}\\
%\vspace*{71.1mm}
\vspace*{60mm}
{ %\scriptsize
\fontsize{10pt}{11pt} \selectfont
\renewcommand*{\arraystretch}{1}
\begin{tabular}{p{72.2mm}p{31mm}@{:}p{0mm}p{50mm}}
& {\bfseries DOCUMENT No.}&& \Doc@Number\\ 
& {\bfseries ISSUE} &&\Doc@Revision\\ 
& {\bfseries DATE} &&\Doc@Date\\ 
& {\bfseries CLASSIFICATION} &&\Doc@Classification\\ 
\end{tabular}
\renewcommand*{\arraystretch}{1.3}
\ \\[0.5mm]} 
\vfill
\end{titlingpage*}
\clearpage
}

%used below in the document change table
\NewDocumentCommand{\DocChangeFormat}{mmmm}{#1&#2&#3&#4\\\hline}
%\NewDocumentCommand{\DocListFormat}{mm}{#1&#2\\}

\newcommand{\formatDocInfo}{\fontsize{12pt}{12pt}\selectfont\bfseries\rule[-4mm]{0pt}{6.6mm} }

\newcommand{\copyrighttext}{'Copyright for the information contained in this document rests with Halcon Systems LLC (HS). 
The information contained in this document is proprietary and confidential. Any unauthorized 
reproduction of the work, in any manner or form, or any unauthorized adaptation, publication or
 utilization, constitutes an act of copyright infringement. Furthermore, this document may not 
 be communicated, in any manner or form, to any third Party without the express written approval 
 of HS, and in any event without similar conditions of confidentiality being imposed on the 
 receiving Party.'}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\ApprovalPage}{

\ResetPage{frontmatter}

\printchaptertitle{APPROVAL}
{\ \\[-9mm]
\begin{Spacing}{1.34}\fontsize{8pt}{9pt} \selectfont
\copyrighttext
\end{Spacing}
}
\ \\[-5.2mm]

\begin{tabular}{@{\hspace{0.5pt}}p{48.2mm}p{1mm}p{100mm}}
  \rule[-8.8mm]{0pt}{12.6mm}TITLE &:&\begin{minipage}[t]{110mm}\MakeUppercase{\Doc@Title}\end{minipage}\\
  \rule[-8.33mm]{0pt}{12.1mm}DOCUMENT NUMBER &:&\parbox{80mm}{\Doc@Number}\parbox{9.5mm}{Issue}\parbox{30mm}{\Doc@Revision}\\
  \rule[-8.2mm]{0pt}{12.7mm}CLASSIFICATION &:&\Doc@Classification\\
  \rule[-8.14mm]{0pt}{12.6mm}ABSTRACT &:&\begin{minipage}[t]{110mm}\Doc@Abstract\end{minipage}\\
  \rule[-8.3mm]{0pt}{12.8mm}AUTHOR &:&\DocAuthorNames\\
  \rule[-9.5mm]{0pt}{14mm}APPROVED BY &:&\\\cline{3-3}
  \rule[-9.5mm]{0pt}{8mm} &&\Doc@ApprovalOneName \ : \ \Doc@ApprovalOneTitle\\   
  \ifthenelse{\equal{\Doc@ApprovalTwoName}{}}{}{%
      \rule[-8mm]{0pt}{12mm} &&\\\cline{3-3}%
      \rule[-6.5mm]{0pt}{3.5mm} &&\Doc@ApprovalTwoName \ : \ \Doc@ApprovalTwoTitle\\%  
      }   
  \ifthenelse{\equal{\Doc@AcceptanceOneName}{}}{}{%
     \rule[-8mm]{0pt}{12mm}ACCEPTED BY &:&\\\cline{3-3}
     \rule[-8mm]{0pt}{5mm} &&\Doc@AcceptanceOneName \ : \ \Doc@AcceptanceOneTitle\\    
      } 
  \ifthenelse{\equal{\Doc@AcceptanceTwoName}{}}{}{%
      \rule[-8mm]{0pt}{12mm} &&\\\cline{3-3}%
      \rule[-9.5mm]{0pt}{6.5mm} &&\Doc@AcceptanceTwoName \ : \ \Doc@AcceptanceTwoTitle\\%  
      } 
  \rule[-9mm]{0pt}{14mm}DATE &:&\Doc@Date\\
  \end{tabular}
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\wpendpadrule}{\rule[-2mm]{0pt}{1mm}}

\newcommand*{\WPCoverPage}{

\ResetPage{frontmatter}
\chapterstyle{headChapterstyle}
\makelocalfrontwidth
% Create the heigth and text for abstract box
\newsavebox{\abstracttitletext}
\savebox{\abstracttitletext}{\begin{minipage}[t]{125mm}\Doc@Abstract \wpendpadrule\end{minipage}}
\newlength{\wptabvertskipabstract} 
\settoheight{\wptabvertskipabstract}{\usebox{\abstracttitletext} }

% Create the height and text for conclusion box
\newsavebox{\conclusiontitletext}
\savebox{\conclusiontitletext}{\begin{minipage}[t]{125mm}\Doc@Conclusions \wpendpadrule\end{minipage}}
\newlength{\wptabvertskipconclusion} 
\settoheight{\wptabvertskipconclusion}{\usebox{\conclusiontitletext} }

% Create the height and text for recommendations box
\newsavebox{\recommendationstitletext}
\savebox{\recommendationstitletext}{\begin{minipage}[t]{125mm}\Doc@Recommendations \wpendpadrule\end{minipage}}
\newlength{\wptabvertskiprecommendations} 
\settoheight{\wptabvertskiprecommendations}{\usebox{\recommendationstitletext} }

% Create the heigth and text for authors box
\newsavebox{\authorstitletext}
\savebox{\authorstitletext}{\begin{minipage}[t]{63mm}\DocAuthorNames \wpendpadrule\end{minipage}}
\newlength{\wptabvertskipauthors} 
\settoheight{\wptabvertskipauthors}{\usebox{\authorstitletext} }

\copypagestyle{WPTitlePageStyle}{empty}
\makerunningwidth{WPTitlePageStyle}[\localtextwidth]{\localtextwidth}
\makeoddhead{WPTitlePageStyle}{}{}{}
\makeevenhead{WPTitlePageStyle}{}{}{}
\makeoddfoot{WPTitlePageStyle}{}{}{}
\makeevenfoot{WPTitlePageStyle}{}{}{}
\pagestyle{WPTitlePageStyle}
\aliaspagestyle{titlingpagestyle}{WPTitlePageStyle}
\aliaspagestyle{titlingpage}{WPTitlePageStyle}
\aliaspagestyle{title}{WPTitlePageStyle}

{
\centering
\vspace*{-2.7mm}
\hspace{-0.5mm}\doLogo{\Doc@CompanyLogo}{90mm}
\ \\
\vspace*{28.4mm}
\begin{minipage}[t][30mm][t]{120mm}
\centering
{\fontsize{18}{22} \selectfont\ \bfseries
\MakeUppercase{\Doc@Title}\\
\par }%
\end{minipage}

\vspace*{14mm}\ \\
\hskip-0.5mm%
\begin{tabular}{|@{}p{1mm}@{}@{}p{36mm}p{63mm}|p{35mm}|p{29mm}|}
\hline
&
% if abstract field is empty, skip the row
\ifthenelse{\equal{\Doc@Abstract}{}}{}{%
\begin{minipage}[t][\wptabvertskipabstract][t]{36mm}ABSTRACT\end{minipage}&%
\multicolumn{3}{|l|}{\usebox{\abstracttitletext}}\\%
\hline%
&%
}%
% if conclusions field is empty, skip the row
\ifthenelse{\equal{\Doc@Conclusions}{}}{}{%
\begin{minipage}[t][\wptabvertskipconclusion][t]{36mm}CONCLUSIONS\end{minipage}&%
\multicolumn{3}{|l|}{\usebox{\conclusiontitletext}}\\%
\hline%
&%
}%
% if recommendations field is empty, skip the row
\ifthenelse{\equal{\Doc@Recommendations}{}}{}{%
\begin{minipage}[t][\wptabvertskiprecommendations][t]{36mm}RECOMMENDATIONS\end{minipage}&%
\multicolumn{3}{|l|}{\usebox{\recommendationstitletext}}\\%
\hline%
&%
}%
\begin{minipage}[t][5.5mm][t]{36mm}DOCUMENT NUMBER\end{minipage}&
\multicolumn{2}{|l|}{\begin{minipage}[t][5.5mm][t]{96mm}\Doc@Number\end{minipage}} &
\begin{minipage}[t][5.5mm][t]{125mm}Issue \Doc@Revision\end{minipage}\\
\hline
&
\begin{minipage}[t][5.5mm][t]{36mm}DATE\end{minipage}&
\multicolumn{3}{|l|}{\begin{minipage}[t][5.5mm][t]{29mm}\Doc@Date\end{minipage}}\\
\hline
&
\begin{minipage}[t][\wptabvertskiprecommendations][t]{36mm}AUTHOR\end{minipage}&
\multicolumn{1}{|l|}{\usebox{\authorstitletext}}&\multicolumn{2}{l|}{}\\
\hline
&
\begin{minipage}[t][5.5mm][t]{36mm}APPROVED BY\end{minipage}&
\multicolumn{1}{|l|}{\begin{minipage}[t][5.5mm][t]{63mm}\Doc@ApprovalOneName\end{minipage}}&
\multicolumn{2}{l|}{}\\
\hline
&
\begin{minipage}[t][5.5mm][t]{36mm}CLASSIFICATION\end{minipage}&
\multicolumn{3}{|l|}{\begin{minipage}[t][5.5mm][t]{125mm}\Doc@Classification\end{minipage}}\\
\hline
&
\begin{minipage}[t][5.5mm][t]{36mm}COPYRIGHT\end{minipage}&
\multicolumn{3}{|l|}{\begin{minipage}[t][24mm][t]{125mm}
\begin{Spacing}{1.25}\fontsize{8pt}{9pt} \selectfont
\Doc@Copyright
\end{Spacing}
\end{minipage}}\\
\hline
\end{tabular}
\vfill
}
\newpage

\ResetPage{body}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%enumerate and itemize
% we have to increase the enum nesting level to 4, copy from enumitem.sty:
\@definecounter{itemv}
\@definecounter{enumv}
\ifenit@loadonly\else
\let\enitdp@enumerate\@enumdepth
\renewenvironment{enumerate}[1][]
  {\enit@enumerate\enitdp@enumerate{enum}4{#1}}
  {\enit@endenumerate}
\let\enitdp@itemize\@itemdepth
\renewenvironment{itemize}[1][]
  {\enit@itemize\enitdp@itemize{item}4{#1}}
  {\enit@enditemize}
\newcount\enitdp@description
\renewenvironment{description}[1][]
  {\enit@description\enitdp@description{description}\@M{#1}}
  {\enit@enddescription}
\fi

%define the enumerate and itemize layout !!using enumitem package
\setlist[enumerate]{leftmargin=7mm,labelwidth=5mm,labelsep=2.mm, align=left}
\setlist[enumerate,1]{label=\arabic*),ref=\arabic*}
\setlist[enumerate,2]{label=\alph*), ref=\theenumi.\alph*}
\setlist[enumerate,3]{label=\roman*), ref=\theenumii.\roman*}
\setlist[enumerate,4]{label=\alph*, ref=\theenumiii.\alph*}
\setlist[enumerate,5]{label=\roman*, ref=\theenumiv.\roman*m}
\setlist[itemize]{leftmargin=7mm,labelwidth=5mm,labelsep=2mm, align=left}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}
\setlist[itemize,4]{label=$\ast$}
\setlist[itemize,5]{label=$\diamond$}


%computer listings
\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}
\lstset{ %
upquote=true, % gives the upquote instead of the curly quote
language={},                % choose the 'not set' language as default
basicstyle=\ttfamily\small,       % the size of the fonts that are used for the code
keywordstyle=,                  % keywords not bold
numbers=none,                   % where to put the line-numbers
backgroundcolor=\color{LightGrey},  % choose the background color,  add \usepackage{color}
showspaces=false,               % show spaces adding particular underscores
showstringspaces=false,         % underline spaces within strings
showtabs=false,                 % show tabs within strings adding particular underscores
frame=none,                   % adds a frame around the code
tabsize=2,              % sets default tabsize to 2 spaces
captionpos=b,                   % sets the caption-position to bottom
breaklines=true,        % sets automatic line breaking
breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
prebreak=\raisebox{0ex}[0ex][0ex]{$\dlsh$}
%escapeinside={\%}{)}          % if you want to add a comment within your code
}

%create labels and citations for the referenced and applicable docs - the normal citation is not used here.
%http://tex.stackexchange.com/questions/49017/need-help-creating-a-custom-aux-file-read-write-routine-to-suit-my-needs
\makeatletter
% The command reference writes \newreference into the aux file
\def\createreference#1#2{\@bsphack
  \protected@write\@mainaux{}{\string\newreference{#1}{#2}}\@esphack}
% The command \newreference defines new command named after the first
% argument that produces the second one
\def\newreference#1#2{%
  \expandafter\xdef\csname rfr@#1\endcsname{#2}}
% And using the reference
\def\citereference#1{%
  \expandafter\ifx\csname rfr@#1\endcsname\relax??\else
  \csname rfr@#1\endcsname\fi}
% LaTeX checks at the end of document whether references have  been changed.
% If any reference is changed, \tempswa is set to true.
% Here we add \newreference commands to the list to be checked.
\AtEndDocument{\def\newreference#1#2{%
    \edef\reserved@a{#2}%
    \expandafter\ifx\csname rfr@#1\endcsname\reserved@a\else
    \@tempswatrue\fi}}
\makeatother

\makeatletter
% The command standard writes \newstandard into the aux file
\def\createstandard#1#2{\@bsphack
  \protected@write\@mainaux{}{\string\newstandard{#1}{#2}}\@esphack}
% The command \newstandard defines new command named after the first
% argument that produces the second one
\def\newstandard#1#2{%
  \expandafter\xdef\csname rfr@#1\endcsname{#2}}
% And using the standard
\def\citestandard#1{%
  \expandafter\ifx\csname rfr@#1\endcsname\relax??\else
  \csname rfr@#1\endcsname\fi}
% LaTeX checks at the end of document whether standards have  been changed.
% If any standard is changed, \tempswa is set to true.
% Here we add \newstandard commands to the list to be checked.
\AtEndDocument{\def\newstandard#1#2{%
    \edef\reserved@a{#2}%
    \expandafter\ifx\csname rfr@#1\endcsname\reserved@a\else
    \@tempswatrue\fi}}
\makeatother

%commands for listliketab

%create the environment to store and print referenced documents
% the same environment type is used for referenced and applicable docs
%http://tex.stackexchange.com/questions/88693/how-to-force-alignment-of-cases-brackets-in-an-enumerate-environment

\makeatletter
\newcommand*{\storestyleofextra}[2][]{%
\begin{lrbox}{\llt@list@box}
\noindent
\begin{minipage}{\linewidth}
\begin{#2}[#1]
\item[] \storeliststyle{}
\end{#2}
\end{minipage}
\end{lrbox}\ignorespacesafterend}
\makeatother

\newcounter{listlikeStdlabel}
\setcounter{listlikeStdlabel}{0}%
\newcommand*{\nextnumstd}{\addtocounter{listlikeStdlabel}{1}\thelistlikeStdlabel.}

%\newcommand{\setuplistliketabalpha}{\setcounter{listlikeStdlabel}{0}\renewcommand*{\thelistlikeStdlabel}{\alph{listlikeStdlabel}}}
%\newcommand{\setuplistliketabnumber}{\setcounter{listlikeStdlabel}{0}\renewcommand*{\thelistlikeStdlabel}{\arabic{listlikeStdlabel}}}

\newenvironment{stdstable}{%
\begin{listliketab}%

\renewcommand*{\thelistlikeStdlabel}{[Std. \arabic{listlikeStdlabel}]}%
\renewcommand*{\item}{\nextnumstd &}%
\renewcommand*{\item}[1]{\nextnumstd \createreference{##1}{\thelistlikeStdlabel}}%
\renewcommand*{\arraystretch}{1.}%
\begin{tabular}{@{}>{\centering} p{15mm}p{100mm}p{47.5mm}@{}}
%\multicolumn{2}{@{}l}{Title}&  Document Number\\
}{
\end{tabular}
\renewcommand*{\arraystretch}{1.3}
\end{listliketab}
}

\newcounter{listlikereflabel}
\setcounter{listlikereflabel}{0}%
\newcommand*{\nextnumref}{\addtocounter{listlikereflabel}{1}\thelistlikereflabel.}

%\newcommand{\setuplistliketabalpha}{\setcounter{listlikereflabel}{0}\renewcommand*{\thelistlikereflabel}{\alph{listlikereflabel}}}
%\newcommand{\setuplistliketabnumber}{\setcounter{listlikereflabel}{0}\renewcommand*{\thelistlikereflabel}{\arabic{listlikereflabel}}}

\newenvironment{refstable}{%
\begin{listliketab}%

\renewcommand*{\thelistlikereflabel}{[Ref. \arabic{listlikereflabel}]}%
\renewcommand*{\item}{\nextnumref &}%
\renewcommand*{\item}[1]{\nextnumref \createreference{##1}{\thelistlikereflabel}}%
\renewcommand*{\arraystretch}{1.}%
\begin{tabular}{@{}>{\centering} p{15mm}p{100mm}p{47.5mm}@{}}
}{
\end{tabular}
\renewcommand*{\arraystretch}{1.3}
\end{listliketab}
}

% general commands
% markup words with coloured boxes.
\newcommand{\HiLite}[1]{\fcolorbox{red}{red}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TBC and TBB highlight boxes	

% TBC not shown in lists
\newcommand{\TBC}[1]{%
    \par
    \noindent
    \begin{minipage}{1.0\linewidth}
      \begin{tcolorbox}[colback=purple!5, colframe=purple!95!black, coltext=black,
        coltitle=white, fonttitle=\bfseries, title={To be completed},%
        left=0mm, right=0mm, top=0mm, bottom=0mm,%
        before=\vspace{2pt}, after=\vspace{2pt}]
        % \setlength{\parskip}{0.5em} \vspace{-0.5em}
        \setlength{\parindent}{1em} \noindent
        #1
      \end{tcolorbox}
    \end{minipage}
}

\newcommand{\listTBCname}{TBD ITEMS}
\newlistof{listofTBCs}{tbc}{\listTBCname}
\newlistentry[chapter]{listTBC}{tbc}{0}

\newcommand{\listTBC}[2]{%
    \par
    \noindent
    \begin{minipage}{1.0\linewidth}
      \begin{tcolorbox}[colback=purple!5, colframe=purple!95!black, coltext=black,
        coltitle=white, fonttitle=\bfseries, title={To be completed},%
        left=0mm, right=0mm, top=0mm, bottom=0mm,%
        before=\vspace{2pt}, after=\vspace{2pt}]
        % \setlength{\parskip}{0.5em} \vspace{-0.5em}
        \setlength{\parindent}{1em} \noindent
        \textbf{#1}\\
        #2
      \end{tcolorbox}
    \end{minipage}
  \refstepcounter{listTBC}%
  \addcontentsline{tbc}{listTBC}{\protect\numberline{\thelistTBC}#1}\par
}


\newcommand{\listTBBname}{NOTES}
\newlistof{listofTBBs}{tbb}{\listTBBname}
\newlistentry[chapter]{TBB}{tbb}{0}

% \TBB{title}{colour}{text}
\newcommand{\TBB}[3]{%
    \par
    \noindent
    \begin{minipage}{1.0\linewidth}
      \begin{tcolorbox}[colback=#2!5, colframe=#2!95!black, coltext=black,
        coltitle=white, fonttitle=\bfseries, title={#1},%
        left=0mm, right=0mm, top=0mm, bottom=0mm,%
        before=\vspace{2pt}, after=\vspace{2pt}]
        % \setlength{\parskip}{0.5em} \vspace{-0.5em}
        \setlength{\parindent}{1em} \noindent
        #3
      \end{tcolorbox}
    \end{minipage}
  \refstepcounter{TBB}%
  \addcontentsline{tbb}{TBB}{\protect\numberline{\theTBB}#1}\par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\tmcoblr}[1]{\multicolumn{1}{|c|}{\textbf{#1}}}
\newcommand{\tmcobl}[1]{\multicolumn{1}{|c}{\textbf{#1}}}
\newcommand{\tmcobr}[1]{\multicolumn{1}{c|}{\textbf{#1}}} 

%superscript and subscript
\newcommand{\tsup}[1]{\textsuperscript{#1}}
\newcommand{\tsub}[1]{\textsubscript{#1}}

\newcommand{\growheader}{\rowcolor[gray]{.9}}

\newcommand{\amendmentstoprow}{\rowcolor[gray]{.9}{\hfil ISSUE \hfil} &{\hfil DATE \hfil} &{\hfil CHANGE REF. \hfil}&{\hfil CHANGE SUMMARY \hfil}}

\newcommand{\coverpage}{
\chapterstyle{headChapterstyle}
\ifthenelse{\equal{\setupworkpackage}{true}}%
{\WPCoverPage}%
{\TitlePage\makelocalfrontwidth\pagestyle{BodyPageStyle}\ApprovalPage}
\ResetPage{frontmatter}
\pagestyle{BodyPageStyle}
}

% set as default for front matter
\ResetPage{frontmatter}
\pagestyle{BodyPageStyle}

%bibliography/references
%http://mirror.ufs.ac.za/ctan/macros/latex/contrib/biblatex/doc/biblatex.pdf
%http://ctan.math.utah.edu/ctan/tex-archive/macros/latex/contrib/biblatex/latex/biblatex.def
%https://tex.stackexchange.com/questions/71088/tabular-bibliography-with-biblatex
%https://tex.stackexchange.com/questions/496995/advanced-introduction-to-biblatex-coding-guidelines-for-database

% filters for different bib tables
% the fllters defined below filter references according to the presence of a 
% keyword in the keywords filed in the bibtext entry.


\defbibfilter{externalBLkey}{keyword={externalBLkey}}
\defbibfilter{standardsBLkey}{keyword={standardsBLkey}}
\defbibfilter{specificationBLkey}{keyword={specificationBLkey}}
\defbibfilter{milreferenceBLkey}{keyword={milreferenceBLkey}}
\defbibfilter{controlledBLkey}{keyword={controlledBLkey}}
\defbibfilter{stanspecmilrBLkey}{keyword={standardsBLkey} or keyword={specificationBLkey} or keyword={milreferenceBLkey}}
\defbibfilter{specmilrBLkey}{keyword={specificationBLkey} or keyword={milreferenceBLkey}}
\defbibfilter{opendocs}{%
not keyword={controlledBLkey} and  %
not keyword={standardsBLkey} and  %
not keyword={specificationBLkey} and  %
not keyword={milreferenceBLkey} %
}
\defbibfilter{notstanspecmilrBLkey}{not keyword={standardsBLkey} and not keyword={specificationBLkey} and not keyword={milreferenceBLkey} and not keyword={externalBLkey}}

% count the entries in the stanspecmilrBLkey list and then all the rest
\newcounter{stanspecmilrBLtot}
\newcounter{notstanspecmilrBLtot}
\AtDataInput{ % https://tex.stackexchange.com/questions/404259/biblatex-how-to-count-entries-in-a-bib-file-without-invoking-printbibliograp
\ifkeyword{standardsBLkey}{\stepcounter{stanspecmilrBLtot}}{%
\ifkeyword{specificationBLkey}{\stepcounter{stanspecmilrBLtot}}{%
\ifkeyword{milreferenceBLkey}{\stepcounter{stanspecmilrBLtot}}{\stepcounter{notstanspecmilrBLtot}}}}}

% Standards Biblo: this command prints either the list or None
\newcommand{\printStandardsBiblio}{
\begingroup
\renewcommand{\chapter}[2]{} % suppress the chapter entry
% now print none or the list
\ifthenelse{\thestanspecmilrBLtot=0}%
{None.}%
{\printbibtabular[filter=stanspecmilrBLkey,heading=none]}
\endgroup 
}

% References Biblo: this command prints either the list or None
\newcommand{\printReferencesBiblio}{
\begingroup
\renewcommand{\chapter}[2]{} % suppress the chapter entry
% now print none or the list
\ifthenelse{\thenotstanspecmilrBLtot=0}%
{None.}%
{\printbibtabular[filter=notstanspecmilrBLkey,heading=none]}
\endgroup 
}

% tabular  format 
\newcolumntype{L}[1]{%
  >{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% hint, look for macros in biblatex.def and other macro files
\defbibtabular{bibtabular}
  {
  \renewbibmacro{year}{\printfield{year}}%
  \newbibmacro{institution}{\printlist{institution}}%
   \newbibmacro*{doi}{\printfield{doi}}%
   \newbibmacro*{author/editorNotEmpty}{%
  \ifboolexpr{test \ifuseauthor and not test {\ifnameundef{author}}}%
    {\ifthenelse{\equal{\thename{author}}{}}{}{\usebibmacro{author}, }}%
    {\ifthenelse{\equal{\thename{editor}}{}}{}{\usebibmacro{editor}, }}%
    }
  \newbibmacro{onlyreportnumber}{\ifthenelse{\equal{\thefield{entrytype}}{report}}{\printfield{number}}{}}
  \newbibmacro{volumenumber}{\ifthenelse{\equal{\thefield{volume}}{}}{}{\printfield{volume}\ifthenelse{\equal{\thefield{number}}{}}{, }{(\printfield{number}), }}}
   \setlength{\LTpre}{0pt}%
   \setlength{\LTpost}{0pt}%
   \renewcommand*{\arraystretch}{1.5}%
   \begin{longtable}{%
     @{}
     L{\dimexpr0.1\textwidth}%-\tabcolsep\relax}
     L{\dimexpr0.6\textwidth}%-2\tabcolsep\relax}
     L{\dimexpr0.2\textwidth}%-\tabcolsep\relax}
     @{}}}
  {\end{longtable}}
{%
\anchorlang{[Ref. \printfield{labelnumber}]} &%
\plainlang{%
\usebibmacro{author/editorNotEmpty}%
\iffieldundef{title}{}{\printfield{title}, }%
\iffieldundef{edition}{}{\printfield{edition}, }%
\iffieldundef{series}{}{\printfield{series}, }%
\iffieldundef{journaltitle}{}{\usebibmacro{journal}, }%
\iffieldundef{booktitle}{}{\usebibmacro{booktitle}, }%
\usebibmacro{volumenumber}%
\iflistundef{institution}{}{\usebibmacro{institution}, }%
\iflistundef{publisher}{}{\printlist{publisher}, }%
%\iflistundef{address}{}{\usebibmacro{address}, }%
\iffieldundef{url}{}{\usebibmacro{url}, }%
\iffieldundef{doi}{}{\usebibmacro{doi}, }%
\iffieldundef{year}{}{\usebibmacro{year}}.%
} &
\plainlang{%
\usebibmacro{onlyreportnumber}%
} 
\\%
}

% prepare for references part
\newcommand{\prepareExternalReferences}{
\ResetPage{frontmatter}
\pagestyle{BodyPageStyle}
\changetext{0mm}{0mm}{0mm}{0mm}{0pt} % from changepage package
\newpage
\makelocalfrontwidth
\chapterstyle{headChapterstyle}
}

% prepare for the appendix sectional.  Standard chapter does not work here
\newcommand{\prepareAppendix}{
\appendix
\renewcommand{\printchaptertitle}[1]{\hspace{15mm}\chaptitlefont ##1}
\renewcommand*{\printchapternum}{\noindent\llap{\makebox[\chapindent][l]{\chapnamefont\MakeTextUppercase{Appendix} \thechapter.}}}
}

% make changes after front matter for body
\newcommand{\prepareBodyLayout}{
\ResetPage{body}
\makelocalbodywidth
\chapterstyle{docChapterstyle} 
\changetext{0mm}{0mm}{0mm}{0mm}{0pt} % from changepage package
}

