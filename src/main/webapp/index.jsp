<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NOVA · friendly dashboard</title>
  <!-- Font Awesome Icons (free) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
    }

    body {
      min-height: 100vh;
      background: #f5f9ff;
      background-image: radial-gradient(circle at 10% 20%, rgba(210, 230, 255, 0.5) 0%, transparent 30%),
                        radial-gradient(circle at 90% 80%, rgba(200, 225, 250, 0.6) 0%, transparent 35%);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 1.5rem;
    }

    /* main card – soft white with airy shadow */
    .app-panel {
      max-width: 1300px;
      width: 100%;
      background: #ffffff;
      border-radius: 2.8rem;
      padding: 2.8rem 3rem;
      box-shadow: 0 30px 50px -20px rgba(30, 60, 100, 0.15),
                  0 0 0 1px rgba(255, 255, 255, 0.9) inset,
                  0 0 0 1px #e2ecf9;
      transition: all 0.2s ease;
      position: relative;
      overflow: hidden;
    }

    /* subtle decorative soft blobs */
    .app-panel::before {
      content: '';
      position: absolute;
      top: -20%;
      left: -10%;
      width: 50%;
      height: 60%;
      background: radial-gradient(circle, rgba(190, 220, 255, 0.3), transparent 70%);
      z-index: 0;
      pointer-events: none;
      filter: blur(70px);
    }

    .app-panel::after {
      content: '';
      position: absolute;
      bottom: -15%;
      right: -5%;
      width: 45%;
      height: 55%;
      background: radial-gradient(circle, rgba(200, 215, 255, 0.35), transparent 70%);
      z-index: 0;
      pointer-events: none;
      filter: blur(80px);
    }

    .panel-content {
      position: relative;
      z-index: 2;
    }

    /* ---------- TOP BAR ---------- */
    .top-bar {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 2.8rem;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }

    .brand-icon {
      background: #1e2b3c;
      color: white;
      width: 48px;
      height: 48px;
      border-radius: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.6rem;
      box-shadow: 0 8px 14px -6px rgba(20, 40, 70, 0.2);
    }

    .brand h1 {
      font-weight: 700;
      font-size: 2rem;
      letter-spacing: -0.02em;
      color: #0d1a2b;
    }

    .brand h1 span {
      color: #2f6bff;
      font-weight: 600;
    }

    .live-clock {
      background: #edf4fe;
      padding: 0.5rem 1.4rem;
      border-radius: 60px;
      border: 1px solid #d8e5f5;
      font-size: 1rem;
      font-weight: 500;
      color: #1e3a5f;
      letter-spacing: 0.5px;
      display: flex;
      align-items: center;
      gap: 0.7rem;
      box-shadow: 0 2px 8px rgba(0, 30, 60, 0.03);
    }

    .live-clock i {
      color: #2f6bff;
      font-size: 0.8rem;
    }

    /* ---------- MAIN GRID ---------- */
    .main-grid {
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 2.8rem;
      margin-top: 0.8rem;
    }

    /* left column */
    .hero-text {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .badge {
      display: inline-flex;
      align-items: center;
      background: #ecf3fe;
      border: 1px solid #d0e2fc;
      padding: 0.4rem 1.2rem;
      border-radius: 40px;
      font-size: 0.85rem;
      font-weight: 600;
      letter-spacing: 0.2px;
      color: #1e4fd9;
      width: fit-content;
      margin-bottom: 1.5rem;
      gap: 6px;
    }

    .badge i {
      font-size: 0.8rem;
    }

    .hero-text h2 {
      font-size: 3.2rem;
      font-weight: 700;
      line-height: 1.15;
      color: #0d1a2b;
      margin-bottom: 1.25rem;
      letter-spacing: -0.03em;
    }

    .hero-text h2 span {
      background: linear-gradient(145deg, #2f6bff, #1f4dd0);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .hero-text p {
      color: #3f4d62;
      font-size: 1.15rem;
      line-height: 1.65;
      max-width: 90%;
      margin-bottom: 2.2rem;
      font-weight: 400;
      opacity: 0.9;
    }

    .action-buttons {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .btn-primary {
      background: #1e2b3c;
      border: none;
      padding: 1rem 2.5rem;
      border-radius: 50px;
      font-weight: 600;
      font-size: 1rem;
      color: white;
      display: inline-flex;
      align-items: center;
      gap: 0.7rem;
      box-shadow: 0 10px 20px -8px rgba(20, 40, 70, 0.25);
      transition: all 0.2s ease;
      cursor: pointer;
      border: 1px solid #1e2b3c;
      letter-spacing: 0.2px;
    }

    .btn-primary:hover {
      background: #0f1a28;
      transform: translateY(-2px);
      box-shadow: 0 16px 28px -8px rgba(20, 40, 70, 0.35);
    }

    .btn-secondary {
      background: #ffffff;
      border: 1.5px solid #d0dae8;
      padding: 1rem 2rem;
      border-radius: 50px;
      font-weight: 600;
      font-size: 1rem;
      color: #1f2c3f;
      display: inline-flex;
      align-items: center;
      gap: 0.7rem;
      transition: all 0.2s ease;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(0, 20, 40, 0.02);
    }

    .btn-secondary i {
      color: #3f5e8c;
    }

    .btn-secondary:hover {
      background: #f5f9ff;
      border-color: #a8bbd4;
      transform: translateY(-2px);
    }

    /* right column – feature cards */
    .feature-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 1.2rem;
    }

    .feature-card {
      background: #ffffff;
      border-radius: 1.8rem;
      padding: 1.5rem 1.3rem;
      border: 1px solid #e6eef9;
      transition: all 0.25s ease;
      box-shadow: 0 8px 18px -10px rgba(20, 50, 90, 0.1);
      display: flex;
      flex-direction: column;
    }

    .feature-card:hover {
      background: #fafdff;
      border-color: #c8daf0;
      transform: translateY(-4px);
      box-shadow: 0 18px 28px -12px rgba(30, 70, 130, 0.15);
    }

    .feature-icon-wrap {
      background: #ecf3fe;
      width: 48px;
      height: 48px;
      border-radius: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 0.9rem;
      color: #1e4fd9;
      font-size: 1.5rem;
      transition: all 0.2s;
    }

    .feature-card:hover .feature-icon-wrap {
      background: #d9e8ff;
      color: #0b3b9e;
    }

    .feature-card h4 {
      color: #0d1a2b;
      font-weight: 600;
      font-size: 1.15rem;
      margin-bottom: 0.35rem;
      letter-spacing: -0.2px;
    }

    .feature-card p {
      color: #526f8f;
      font-size: 0.9rem;
      line-height: 1.5;
      font-weight: 400;
    }

    .feature-card .tag {
      margin-top: 1rem;
      font-size: 0.7rem;
      text-transform: uppercase;
      letter-spacing: 0.4px;
      color: #1e4fd9;
      background: #e8f1fe;
      padding: 0.25rem 0.9rem;
      border-radius: 40px;
      align-self: flex-start;
      border: 1px solid #d2e3fc;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 5px;
    }

    .tag i {
      font-size: 0.7rem;
    }

    /* bottom statistic bar */
    .stats-bar {
      margin-top: 3.4rem;
      padding-top: 1.8rem;
      border-top: 1px solid #e6eef9;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 1.2rem;
    }

    .stat-item {
      display: flex;
      align-items: center;
      gap: 0.7rem;
      color: #3f5e7c;
      font-size: 0.95rem;
      font-weight: 500;
      background: #f9fcff;
      padding: 0.5rem 1.2rem 0.5rem 0.9rem;
      border-radius: 50px;
      border: 1px solid #e3edfa;
      transition: all 0.15s;
    }

    .stat-item:hover {
      background: #edf5ff;
      border-color: #c1d6f0;
    }

    .stat-item i {
      color: #2f6bff;
      font-size: 1rem;
      opacity: 0.8;
      width: 18px;
    }

    .stat-item strong {
      font-weight: 700;
      color: #0d1a2b;
      font-size: 1.1rem;
      margin-right: 0.2rem;
    }

    /* responsive */
    @media (max-width: 1000px) {
      .main-grid {
        grid-template-columns: 1fr;
        gap: 2rem;
      }
      .hero-text h2 {
        font-size: 2.7rem;
      }
      .app-panel {
        padding: 2rem 1.8rem;
        border-radius: 2.2rem;
      }
    }

    @media (max-width: 650px) {
      .top-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
      }
      .feature-grid {
        grid-template-columns: 1fr;
      }
      .hero-text p {
        max-width: 100%;
      }
      .stats-bar {
        flex-direction: column;
        align-items: flex-start;
      }
      .brand h1 {
        font-size: 1.8rem;
      }
      .action-buttons {
        flex-direction: column;
        width: 100%;
      }
      .btn-primary, .btn-secondary {
        width: 100%;
        justify-content: center;
      }
    }

    @media (max-width: 450px) {
      .app-panel {
        padding: 1.5rem 1.2rem;
        border-radius: 1.8rem;
      }
      .hero-text h2 {
        font-size: 2.2rem;
      }
      .stat-item {
        width: 100%;
      }
    }

    /* friendly micro-interactions */
    .feature-card, .btn-primary, .btn-secondary, .stat-item {
      transition: all 0.25s cubic-bezier(0.2, 0.9, 0.3, 1);
    }

    /* scrollbar */
    ::-webkit-scrollbar {
      width: 6px;
      background: #eef4fc;
    }
    ::-webkit-scrollbar-thumb {
      background: #a9c2e0;
      border-radius: 10px;
    }
    ::-webkit-scrollbar-thumb:hover {
      background: #8aadcf;
    }
  </style>
</head>
<body>
  <div class="app-panel">
    <div class="panel-content">

      <!-- top bar -->
      <div class="top-bar">
        <div class="brand">
          <div class="brand-icon">
            <i class="fas fa-bolt"></i>
          </div>
          <h1>NOVA<span>.</span></h1>
        </div>
        <div class="live-clock" id="clockDisplay">
          <i class="fas fa-circle"></i>
          <span id="clockText">00:00:00</span>
        </div>
      </div>

      <!-- main grid -->
      <div class="main-grid">
        <!-- left column -->
        <div class="hero-text">
          <div class="badge">
            <i class="fas fa-arrow-trend-up"></i> friendly & intuitive
          </div>
          <h2>Build smarter <br><span>with dynamic</span> flows</h2>
          <p>Explore a fresh take on dashboard layouts. Clean, modular, and ready for your data — no complexity, just clarity.</p>
          <div class="action-buttons">
            <button class="btn-primary"><i class="fas fa-rocket"></i> Launch</button>
            <button class="btn-secondary"><i class="fas fa-code"></i> Docs</button>
          </div>
        </div>

        <!-- right column: feature cards -->
        <div class="feature-grid">
          <div class="feature-card">
            <div class="feature-icon-wrap">
              <i class="fas fa-chart-pie"></i>
            </div>
            <h4>Analytics</h4>
            <p>Real‑time metrics with interactive filters.</p>
            <span class="tag"><i class="far fa-clock"></i> live</span>
          </div>
          <div class="feature-card">
            <div class="feature-icon-wrap">
              <i class="fas fa-cloud-upload-alt"></i>
            </div>
            <h4>Sync</h4>
            <p>Seamless integration across all devices.</p>
            <span class="tag"><i class="fas fa-check-circle"></i> active</span>
          </div>
          <div class="feature-card">
            <div class="feature-icon-wrap">
              <i class="fas fa-shield-alt"></i>
            </div>
            <h4>Privacy</h4>
            <p>End‑to‑end encryption by default.</p>
            <span class="tag"><i class="fas fa-lock"></i> secure</span>
          </div>
          <div class="feature-card">
            <div class="feature-icon-wrap">
              <i class="fas fa-bolt"></i>
            </div>
            <h4>Performance</h4>
            <p>Optimized for speed & low latency.</p>
            <span class="tag"><i class="fas fa-tachometer-alt"></i> 0.8ms</span>
          </div>
        </div>
      </div>

      <!-- stats -->
      <div class="stats-bar">
        <div class="stat-item"><i class="fas fa-users"></i> <strong>12.4k</strong> active users</div>
        <div class="stat-item"><i class="fas fa-database"></i> <strong>8.2 TB</strong> processed</div>
        <div class="stat-item"><i class="fas fa-check-circle"></i> <strong>99.9%</strong> uptime</div>
        <div class="stat-item"><i class="fas fa-code-branch"></i> <strong>v3.2</strong> · stable</div>
      </div>

    </div> <!-- /panel-content -->
  </div> <!-- /app-panel -->

  <!-- live clock script -->
  <script>
    (function updateClock() {
      const clockEl = document.getElementById('clockText');
      if (!clockEl) return;

      function pad(n) { return n.toString().padStart(2, '0'); }

      function refresh() {
        const now = new Date();
        const h = pad(now.getHours());
        const m = pad(now.getMinutes());
        const s = pad(now.getSeconds());
        clockEl.textContent = `${h}:${m}:${s}`;
      }

      refresh();
      setInterval(refresh, 1000);
    })();

    // small extra: friendly console greeting
    console.log('🌟 NOVA · friendly interface ready — designed for humans');
  </script>
</body>
</html>
