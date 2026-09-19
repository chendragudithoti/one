<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="NOVA – a clean, friendly analytics dashboard.">
  <title>NOVA · Friendly Dashboard</title>

  <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">

  <style>
    :root {
      --bg: #f5f9ff;
      --surface: #ffffff;
      --text: #0d1a2b;
      --text-muted: #3a4a5f;
      --text-soft: #526f8f;
      --accent: #2f6bff;
      --accent-dark: #1f4dd0;
      --accent-soft: #ecf3fe;
      --border: #e2ecf9;
      --border-strong: #d0dae8;
      --shadow-sm: 0 2px 8px rgba(0, 30, 60, 0.04);
      --shadow-md: 0 8px 18px -10px rgba(20, 50, 90, 0.12);
      --shadow-lg: 0 30px 50px -20px rgba(30, 60, 100, 0.18);
      --radius-lg: 2.5rem;
      --radius-md: 1.5rem;
      --radius-sm: 0.9rem;
      --radius-pill: 999px;
      --focus: 3px solid #1f4dd0;
      --focus-offset: 3px;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    html { -webkit-text-size-adjust: 100%; }

    body {
      min-height: 100vh;
      font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
      color: var(--text);
      background: var(--bg);
      background-image:
        radial-gradient(circle at 10% 20%, rgba(210, 230, 255, 0.55) 0%, transparent 30%),
        radial-gradient(circle at 90% 80%, rgba(200, 225, 250, 0.6) 0%, transparent 35%);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 1.5rem;
      line-height: 1.55;
    }

    /* Skip link for keyboard users */
    .skip-link {
      position: absolute;
      top: -100px;
      left: 1rem;
      background: var(--text);
      color: #fff;
      padding: 0.75rem 1.25rem;
      border-radius: var(--radius-sm);
      text-decoration: none;
      font-weight: 600;
      z-index: 100;
      transition: top 0.2s ease;
    }
    .skip-link:focus { top: 1rem; }

    .app-panel {
      max-width: 1300px;
      width: 100%;
      background: var(--surface);
      border-radius: var(--radius-lg);
      padding: clamp(1.5rem, 4vw, 2.8rem) clamp(1.2rem, 4vw, 3rem);
      box-shadow: var(--shadow-lg), 0 0 0 1px #e2ecf9;
      position: relative;
      overflow: hidden;
    }

    .app-panel::before,
    .app-panel::after {
      content: '';
      position: absolute;
      z-index: 0;
      pointer-events: none;
      filter: blur(70px);
    }
    .app-panel::before {
      top: -20%; left: -10%; width: 50%; height: 60%;
      background: radial-gradient(circle, rgba(190, 220, 255, 0.35), transparent 70%);
    }
    .app-panel::after {
      bottom: -15%; right: -5%; width: 45%; height: 55%;
      background: radial-gradient(circle, rgba(200, 215, 255, 0.4), transparent 70%);
    }

    .panel-content { position: relative; z-index: 2; }

    /* ---------- FOCUS STATES ---------- */
    a:focus-visible,
    button:focus-visible {
      outline: var(--focus);
      outline-offset: var(--focus-offset);
      border-radius: var(--radius-pill);
    }

    /* ---------- TOP BAR ---------- */
    .top-bar {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 1rem;
      margin-bottom: 2.5rem;
    }

    .brand { display: flex; align-items: center; gap: 0.75rem; }

    .brand-icon {
      background: var(--text);
      color: #fff;
      width: 48px;
      height: 48px;
      border-radius: var(--radius-sm);
      display: grid;
      place-items: center;
      font-size: 1.5rem;
      box-shadow: var(--shadow-sm);
      flex-shrink: 0;
    }

    .brand h1 {
      font-weight: 700;
      font-size: clamp(1.5rem, 3vw, 2rem);
      letter-spacing: -0.02em;
      color: var(--text);
    }
    .brand h1 span { color: var(--accent); }

    .live-clock {
      background: var(--accent-soft);
      padding: 0.55rem 1.25rem;
      border-radius: var(--radius-pill);
      border: 1px solid var(--border-strong);
      font-size: 0.95rem;
      font-weight: 500;
      color: var(--text);
      display: inline-flex;
      align-items: center;
      gap: 0.6rem;
      box-shadow: var(--shadow-sm);
      font-variant-numeric: tabular-nums;
    }
    .live-clock i { color: var(--accent); font-size: 0.7rem; }
    .live-clock .date { color: var(--text-soft); font-weight: 400; }

    /* ---------- MAIN GRID ---------- */
    .main-grid {
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: clamp(1.5rem, 3vw, 2.8rem);
    }

    .hero-text { display: flex; flex-direction: column; justify-content: center; }

    .badge {
      display: inline-flex;
      align-items: center;
      background: var(--accent-soft);
      border: 1px solid #d0e2fc;
      padding: 0.4rem 1.1rem;
      border-radius: var(--radius-pill);
      font-size: 0.85rem;
      font-weight: 600;
      color: var(--accent-dark);
      width: fit-content;
      margin-bottom: 1.4rem;
      gap: 6px;
    }

    .hero-text h2 {
      font-size: clamp(2rem, 5vw, 3.2rem);
      font-weight: 700;
      line-height: 1.12;
      color: var(--text);
      margin-bottom: 1.25rem;
      letter-spacing: -0.03em;
    }
    .hero-text h2 span {
      background: linear-gradient(145deg, var(--accent), var(--accent-dark));
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .hero-text p {
      color: var(--text-muted);
      font-size: clamp(1rem, 1.4vw, 1.15rem);
      line-height: 1.65;
      max-width: 90%;
      margin-bottom: 2rem;
    }

    .action-buttons {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
    }

    /* ---------- BUTTONS ---------- */
    .btn {
      font-family: inherit;
      font-size: 1rem;
      font-weight: 600;
      padding: 0.95rem 2.2rem;
      border-radius: var(--radius-pill);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.65rem;
      cursor: pointer;
      text-decoration: none;
      min-height: 48px;
      transition: transform 0.18s ease, box-shadow 0.18s ease,
                  background-color 0.18s ease, border-color 0.18s ease;
    }

    .btn-primary {
      background: var(--text);
      color: #fff;
      border: 1px solid var(--text);
      box-shadow: 0 10px 20px -8px rgba(20, 40, 70, 0.3);
    }
    .btn-primary:hover {
      background: #0f1a28;
      transform: translateY(-2px);
      box-shadow: 0 16px 28px -8px rgba(20, 40, 70, 0.4);
    }
    .btn-primary:active { transform: translateY(0); }

    .btn-secondary {
      background: var(--surface);
      color: var(--text);
      border: 1.5px solid var(--border-strong);
      box-shadow: var(--shadow-sm);
    }
    .btn-secondary:hover {
      background: var(--accent-soft);
      border-color: #a8bbd4;
      transform: translateY(-2px);
    }
    .btn-secondary i { color: var(--accent); }

    /* ---------- FEATURE CARDS ---------- */
    .feature-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 1.1rem;
    }

    .feature-card {
      display: flex;
      flex-direction: column;
      background: var(--surface);
      border-radius: var(--radius-md);
      padding: 1.4rem 1.25rem;
      border: 1px solid #e6eef9;
      box-shadow: var(--shadow-md);
      text-decoration: none;
      color: inherit;
      transition: transform 0.22s ease, box-shadow 0.22s ease,
                  border-color 0.22s ease, background-color 0.22s ease;
    }
    .feature-card:hover,
    .feature-card:focus-visible {
      background: #fafdff;
      border-color: #c8daf0;
      transform: translateY(-4px);
      box-shadow: 0 18px 28px -12px rgba(30, 70, 130, 0.18);
    }

    .feature-icon-wrap {
      background: var(--accent-soft);
      width: 48px;
      height: 48px;
      border-radius: var(--radius-sm);
      display: grid;
      place-items: center;
      margin-bottom: 0.9rem;
      color: var(--accent-dark);
      font-size: 1.4rem;
      transition: background-color 0.2s ease;
    }
    .feature-card:hover .feature-icon-wrap,
    .feature-card:focus-visible .feature-icon-wrap {
      background: #d9e8ff;
    }

    .feature-card h3 {
      color: var(--text);
      font-weight: 600;
      font-size: 1.1rem;
      margin-bottom: 0.3rem;
      letter-spacing: -0.01em;
    }
    .feature-card p {
      color: var(--text-soft);
      font-size: 0.9rem;
      line-height: 1.5;
      margin-bottom: 0.9rem;
    }

    .tag {
      margin-top: auto;
      font-size: 0.72rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      color: var(--accent-dark);
      background: #e8f1fe;
      padding: 0.3rem 0.85rem;
      border-radius: var(--radius-pill);
      align-self: flex-start;
      border: 1px solid #d2e3fc;
      font-weight: 700;
      display: inline-flex;
      align-items: center;
      gap: 5px;
    }

    /* ---------- STATS ---------- */
    .stats-bar {
      margin-top: clamp(2rem, 4vw, 3.2rem);
      padding-top: 1.6rem;
      border-top: 1px solid var(--border);
      display: flex;
      flex-wrap: wrap;
      gap: 0.9rem;
    }

    .stat-item {
      display: inline-flex;
      align-items: center;
      gap: 0.6rem;
      color: var(--text-muted);
      font-size: 0.92rem;
      font-weight: 500;
      background: #f9fcff;
      padding: 0.55rem 1.1rem 0.55rem 0.9rem;
      border-radius: var(--radius-pill);
      border: 1px solid #e3edfa;
      transition: background-color 0.15s ease, border-color 0.15s ease;
    }
    .stat-item:hover {
      background: #edf5ff;
      border-color: #c1d6f0;
    }
    .stat-item i { color: var(--accent); font-size: 0.95rem; width: 18px; }
    .stat-item strong {
      font-weight: 700;
      color: var(--text);
      font-size: 1rem;
    }

    /* ---------- RESPONSIVE ---------- */
    @media (max-width: 1000px) {
      .main-grid { grid-template-columns: 1fr; gap: 2rem; }
      .hero-text p { max-width: 100%; }
    }

    @media (max-width: 640px) {
      body { padding: 1rem; }
      .top-bar { flex-direction: column; align-items: flex-start; }
      .feature-grid { grid-template-columns: 1fr; }
      .action-buttons { flex-direction: column; width: 100%; }
      .btn { width: 100%; }
      .stats-bar { flex-direction: column; align-items: stretch; }
      .stat-item { width: 100%; }
    }

    /* ---------- REDUCED MOTION ---------- */
    @media (prefers-reduced-motion: reduce) {
      *, *::before, *::after {
        animation-duration: 0.001ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.001ms !important;
        scroll-behavior: auto !important;
      }
      .feature-card:hover,
      .btn:hover { transform: none; }
    }

    /* ---------- SCROLLBAR ---------- */
    ::-webkit-scrollbar { width: 8px; background: #eef4fc; }
    ::-webkit-scrollbar-thumb { background: #a9c2e0; border-radius: 10px; }
    ::-webkit-scrollbar-thumb:hover { background: #8aadcf; }

    /* ---------- SCREEN READER ONLY ---------- */
    .sr-only {
      position: absolute;
      width: 1px; height: 1px;
      padding: 0; margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      white-space: nowrap;
      border: 0;
    }
  </style>
</head>
<body>

  <a class="skip-link" href="#main">Skip to main content</a>

  <div class="app-panel">
    <div class="panel-content">

      <!-- ===== TOP BAR ===== -->
      <header class="top-bar">
        <div class="brand">
          <div class="brand-icon" aria-hidden="true">
            <i class="fas fa-bolt"></i>
          </div>
          <h1>NOVA<span aria-hidden="true">.</span></h1>
        </div>

        <div class="live-clock" role="status" aria-live="polite" aria-atomic="true">
          <i class="fas fa-circle" aria-hidden="true"></i>
          <span class="date" id="clockDate">—</span>
          <span id="clockText">--:--:--</span>
        </div>
      </header>

      <!-- ===== MAIN ===== -->
      <main id="main" class="main-grid">

        <!-- Left: hero -->
        <section class="hero-text" aria-labelledby="hero-heading">
          <div class="badge">
            <i class="fas fa-arrow-trend-up" aria-hidden="true"></i>
            Friendly &amp; intuitive
          </div>

          <h2 id="hero-heading">
            Build smarter <br>
            <span>with dynamic</span> flows
          </h2>

          <p>
            Explore a fresh take on dashboard layouts. Clean, modular,
            and ready for your data — no complexity, just clarity.
          </p>

          <div class="action-buttons">
            <a href="#features" class="btn btn-primary">
              <i class="fas fa-rocket" aria-hidden="true"></i>
              Launch
            </a>
            <a href="#docs" class="btn btn-secondary">
              <i class="fas fa-code" aria-hidden="true"></i>
              Read the docs
            </a>
          </div>
        </section>

        <!-- Right: features -->
        <section id="features" class="feature-grid" aria-label="Key features">
          <a class="feature-card" href="#analytics">
            <div class="feature-icon-wrap" aria-hidden="true">
              <i class="fas fa-chart-pie"></i>
            </div>
            <h3>Analytics</h3>
            <p>Real-time metrics with interactive filters.</p>
            <span class="tag">
              <i class="fas fa-clock" aria-hidden="true"></i> Live
            </span>
          </a>

          <a class="feature-card" href="#sync">
            <div class="feature-icon-wrap" aria-hidden="true">
              <i class="fas fa-cloud-upload-alt"></i>
            </div>
            <h3>Sync</h3>
            <p>Seamless integration across all devices.</p>
            <span class="tag">
              <i class="fas fa-check-circle" aria-hidden="true"></i> Active
            </span>
          </a>

          <a class="feature-card" href="#privacy">
            <div class="feature-icon-wrap" aria-hidden="true">
              <i class="fas fa-shield-alt"></i>
            </div>
            <h3>Privacy</h3>
            <p>End-to-end encryption enabled by default.</p>
            <span class="tag">
              <i class="fas fa-lock" aria-hidden="true"></i> Secure
            </span>
          </a>

          <a class="feature-card" href="#performance">
            <div class="feature-icon-wrap" aria-hidden="true">
              <i class="fas fa-bolt"></i>
            </div>
            <h3>Performance</h3>
            <p>Optimized for speed and low latency.</p>
            <span class="tag">
              <i class="fas fa-tachometer-alt" aria-hidden="true"></i> 0.8 ms
            </span>
          </a>
        </section>
      </main>

      <!-- ===== STATS ===== -->
      <footer class="stats-bar" aria-label="Platform statistics">
        <div class="stat-item">
          <i class="fas fa-users" aria-hidden="true"></i>
          <span><strong>12.4k</strong> active users</span>
        </div>
        <div class="stat-item">
          <i class="fas fa-database" aria-hidden="true"></i>
          <span><strong>8.2 TB</strong> processed</span>
        </div>
        <div class="stat-item">
          <i class="fas fa-check-circle" aria-hidden="true"></i>
          <span><strong>99.9%</strong> uptime</span>
        </div>
        <div class="stat-item">
          <i class="fas fa-code-branch" aria-hidden="true"></i>
          <span><strong>v3.2</strong> · stable</span>
        </div>
      </footer>

    </div>
  </div>

  <script>
    (function () {
      const clockText = document.getElementById('clockText');
      const clockDate = document.getElementById('clockDate');
      if (!clockText) return;

      const pad = (n) => n.toString().padStart(2, '0');

      function refresh() {
        const now = new Date();

        // If user prefers reduced motion, only update every minute
        const timeStr =
          pad(now.getHours()) + ':' +
          pad(now.getMinutes()) + ':' +
          pad(now.getSeconds());
        clockText.textContent = timeStr;

        if (clockDate) {
          const dateStr = now.toLocaleDateString(undefined, {
            weekday: 'short',
            month: 'short',
            day: 'numeric'
          });
          clockDate.textContent = dateStr;
        }
      }

      refresh();
      setInterval(refresh, 1000);
    })();
  </script>
</body>
</html>
