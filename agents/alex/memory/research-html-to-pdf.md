# Research: HTML to PDF Libraries & Extensions

**Date:** 2026-03-03  
**Researcher:** Alex  
**Topic:** Libraries and extensions for converting HTML to PDF

---

## Top Libraries for HTML to PDF Conversion

### 1. **Puppeteer Report** (JavaScript/TypeScript)
- **Best for:** Node.js, JavaScript projects
- **Features:** Custom headers, footers, page numbers
- **Install:** `npm i puppeteer-report`
- **Pros:** Supports modern CSS/HTML, Unicode, JavaScript execution
- **Cons:** Requires Puppeteer (Chromium)
- **Link:** https://github.com/PejmanNik/puppeteer-report

### 2. **Dompdf** (PHP)
- **Best for:** PHP projects
- **Features:** Pure PHP, no external dependencies
- **Install:** `composer require dompdf/dompdf`
- **Pros:** Easy to install, good for basic HTML
- **Cons:** Limited CSS support
- **Link:** https://github.com/dompdf/dompdf

### 3. **PDFKit** (Ruby)
- **Best for:** Ruby/Rails projects
- **Features:** Programmatic PDF creation
- **Install:** `gem install pdfkit`
- **Pros:** Mature, well-documented
- **Cons:** Requires wkhtmltopdf system binary
- **Link:** https://github.com/pdfkit/pdfkit

### 4. **xhtml2pdf** (Python)
- **Best for:** Python projects
- **Features:** HTML to PDF with ReportLab
- **Install:** `pip install xhtml2pdf`
- **Pros:** Pure Python, easy integration
- **Cons:** Limited CSS3 support
- **Link:** https://github.com/xhtml2pdf/xhtml2pdf

### 5. **Gotenberg** (Go/API)
- **Best for:** Microservices, APIs
- **Features:** Docker-based, developer-friendly API
- **Install:** Docker container
- **Pros:** Many formats supported, production-ready
- **Cons:** Requires Docker
- **Link:** https://github.com/gotenberg/gotenberg

### 6. **Snappy (wkhtmltopdf wrapper)** (PHP)
- **Best for:** PHP projects needing wkhtmltopdf power
- **Install:** `composer require knplabs/knp-snappy`
- **Pros:** Full webkit rendering
- **Cons:** wkhtmltopdf is deprecated
- **Link:** https://github.com/KnpLabs/snappy

### 7. **Plutoprint** (Python)
- **Best for:** Python with modern CSS
- **Features:** Modern HTML/CSS support
- **Install:** `pip install plutoprint`
- **Link:** https://github.com/plutoprint/plutoprint

---

## Browser Extensions (Chrome)

For quick browser-based conversion:

| Extension | Features |
|-----------|----------|
| **Print to PDF** | Built-in (Ctrl+P → Save as PDF) |
| **PDF Viewer** | View & annotate PDFs |
| **Web to PDF** | One-click conversion |

---

## Recommendations

### For Developers:
- **JavaScript/Node:** Puppeteer Report
- **Python:** xhtml2pdf or Plutoprint  
- **PHP:** Dompdf
- **API/Microservices:** Gotenberg

### For Non-Technical Users:
- **Browser:** Use Ctrl+P → Save as PDF
- **Online Tools:** convertio.co, cloudconvert.com

---

## Source:
- https://github.com/topics/html-to-pdf
- https://github.com/PejmanNik/puppeteer-report
