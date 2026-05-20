# Department Analysis

## Objective
The purpose of this analysis was to evaluate department performance, identify top and bottom-performing departments, and investigate unusual sales behavior across product categories.

---

## 1. Top-Performing Departments

### Analysis
Departments were ranked based on total sales to identify the strongest revenue contributors.

### Key Findings
- **Department 92 generated the highest sales performance**
- **Departments 95 and 38 also contributed significantly to revenue**
- A small number of departments generated a large portion of total sales

### Business Insight
Sales performance appears concentrated among a limited number of departments, suggesting that a few product categories contribute disproportionately to overall business revenue.

---

## 2. Bottom-Performing Departments

### Analysis
Departments with the lowest sales performance were identified to understand weaker product categories.

### Key Findings
- Some departments generated extremely low sales
- **Department 47 recorded negative sales**
- Several departments contributed very little revenue overall

### Business Insight
Low-performing departments may indicate weak product demand, niche product categories, or operational inefficiencies requiring further review.

---

## 3. Negative Sales Investigation

### Analysis
Departments with negative sales transactions were investigated to determine whether unusual sales activity existed.

### Key Findings
- Negative sales transactions appeared across multiple departments
- Negative values were generally small in magnitude
- The pattern suggests retail operational behavior rather than major data quality issues

### Business Insight
Negative sales likely represent **customer returns, refunds, inventory corrections, or cancelled purchases**, which are common in retail operations.

---

## 4. Department Ranking Analysis

### Analysis
Departments were ranked using a window function (`RANK()`) to benchmark performance across all product categories.

### Key Findings
- **Department 92 ranked as the strongest-performing department**
- Department performance varied significantly across categories
- Revenue contribution was unevenly distributed

### Business Insight
Department ranking provides a clearer understanding of which product categories drive business performance and where operational focus should be prioritized.

---

## Overall Conclusion

The analysis revealed substantial variation in department performance across the retail business.

### Major Findings
- **Department 92 emerged as the strongest revenue contributor**
- A small number of departments generated most of the sales revenue
- Several departments recorded very low or negative sales
- Negative sales activity appears to reflect normal retail processes such as returns and refunds

Overall, department performance is uneven, highlighting opportunities to optimize product strategy, inventory planning, and operational decision-making.