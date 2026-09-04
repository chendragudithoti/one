<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NOVA · dynamic landing</title>
  <!-- Font Awesome Icons (free) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
    }

    body {
      min-height: 100vh;
      background: #0b0d15;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 1.5rem;
    }

    /* main card – glassmorphism + gradient border */
    .glass-panel {
      max-width: 1300px;
      width: 100%;
      background: rgba(18, 22, 33, 0.65);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 3.5rem;
      padding: 2.8rem 3rem;
      box-shadow: 0 25px 50px -8px rgba(0, 0, 0, 0.8), 0 0 0 1px rgba(255, 255, 255, 0.04);
      border: 1px solid rgba(255, 255, 255, 0.03);
      transition: all 0.2s ease;
      position: relative;
      overflow: hidden;
    }

    /* animated gradient orbs (background flair) */
    .glass-panel::before {
      content: '';
      position: absolute;
      top: -30%;
      left: -20%;
      width: 70%;
      height: 80%;
      background: radial-gradient(circle at 30% 40%, rgba(0, 200, 255, 0.15), transparent 70%);
      z-index: 0;
      pointer-events: none;
      filter: blur(60px);
    }

    .glass-panel::after {
      content: '';
      position: absolute;
      bottom: -20%;
      right: -10%;
      width: 60%;
      height: 70%;
      background: radial-gradient(circle at 70% 60%, rgba(200, 50, 255, 0.12), transparent 70%);
      z-index: 0;
      pointer-events: none;
      filter: blur(70px);
    }

    /* all content above pseudo-elements */
    .panel-content {
      position: relative;
      z-index: 2;
    }

    /* ---------- LAYOUT ---------- */
    .top-bar {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 3rem;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 0.6rem;
    }

    .brand i {
      font-size: 2.2rem;
      color: #7fd1ff;
      filter: drop-shadow(0 0 8px rgba(0, 180, 255, 0.4));
    }

    .brand h1 {
      font-weight: 600;
      font-size: 2rem;
      letter-spacing: -0.5px;
      background: linear-gradient(135deg, #f0f9ff, #b7e4ff);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }

    .live-clock {
      background: rgba(255, 255, 255, 0.03);
      padding: 0.5rem 1.4rem;
      border-radius: 60px;
      border: 1px solid rgba(255, 255, 255, 0.06);
      backdrop-filter: blur(4px);
      font-size: 1.1rem;
      font-weight: 400;
      color: #b9d0e6;
      letter-spacing: 1px;
      display: flex;
      align-items: center;
      gap: 0.7rem;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    .live-clock i {
      color: #6fcbff;
      font-size: 1rem;
    }

    /* main grid */
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
      display: inline-block;
      background: rgba(100, 200, 255, 0.08);
      border: 1px solid rgba(100, 200, 255, 0.15);
      padding: 0.3rem 1.2rem;
      border-radius: 40px;
      font-size: 0.8rem;
      font-weight: 500;
      letter-spacing: 0.3px;
      color: #99d1ff;
      width: fit-content;
      margin-bottom: 1.4rem;
      backdrop-filter: blur(2px);
    }

    .hero-text h2 {
      font-size: 3.2rem;
      font-weight: 600;
      line-height: 1.2;
      color: #eef5fc;
      margin-bottom: 1rem;
      letter-spacing: -1px;
    }

    .hero-text h2 span {
      background: linear-gradient(145deg, #a3d8ff, #7aa9ff);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }

    .hero-text p {
      color: #b6ccdf;
      font-size: 1.1rem;
      line-height: 1.6;
      max-width: 90%;
      margin-bottom: 2.2rem;
      font-weight: 300;
      opacity: 0.9;
    }

    .action-buttons {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .btn-primary {
      background: linear-gradient(145deg, #3d8cff, #1f5fd9);
      border: none;
      padding: 0.9rem 2.4rem;
      border-radius: 60px;
      font-weight: 600;
      font-size: 1rem;
      color: white;
      display: inline-flex;
      align-items: center;
      gap: 0.6rem;
      box-shadow: 0 10px 20px -8px rgba(30, 100, 255, 0.25);
      transition: all 0.2s ease;
      cursor: pointer;
      border: 1px solid rgba(255, 255, 255, 0.08);
      letter-spacing: 0.3px;
    }

    .btn-primary:hover {
      transform: scale(1.02);
      background: linear-gradient(145deg, #519aff, #2a6ee9);
      box-shadow: 0 16px 28px -8px rgba(30, 100, 255, 0.4);
    }

    .btn-secondary {
      background: rgba(255, 255, 255, 0.02);
      backdrop-filter: blur(6px);
      border: 1px solid rgba(255, 255, 255, 0.08);
      padding: 0.9rem 2rem;
      border-radius: 60px;
      font-weight: 500;
      font-size: 1rem;
      color: #d3e5f5;
      display: inline-flex;
      align-items: center;
      gap: 0.6rem;
      transition: all 0.2s ease;
      cursor: pointer;
    }

    .btn-secondary:hover {
      background: rgba(255, 255, 255, 0.06);
      border-color: rgba(255, 255, 255, 0.15);
      color: white;
    }

    /* right column – feature cards */
    .feature-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 1.2rem;
    }

    .feature-card {
      background: rgba(255, 255, 255, 0.02);
      backdrop-filter: blur(6px);
      border-radius: 2rem;
      padding: 1.5rem 1.2rem;
      border: 1px solid rgba(255, 255, 255, 0.03);
      transition: all 0.2s ease;
      box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);
      display: flex;
      flex-direction: column;
    }

    .feature-card:hover {
      background: rgba(255, 255, 255, 0.04);
      border-color: rgba(255, 255, 255, 0.08);
      transform: translateY(-4px);
    }

    .feature-card i {
      font-size: 1.8rem;
      color: #7fc9ff;
      margin-bottom: 0.7rem;
      filter: drop-shadow(0 0 6px rgba(0, 150, 255, 0.2));
    }

    .feature-card h4 {
      color: #f0f7fe;
      font-weight: 500;
      font-size: 1.1rem;
      margin-bottom: 0.4rem;
    }

    .feature-card p {
      color: #b1c9df;
      font-size: 0.85rem;
      line-height: 1.4;
      font-weight: 300;
    }

    .feature-card .tag {
      margin-top: 0.8rem;
      font-size: 0.7rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      color: #7aa9d9;
      background: rgba(60, 130, 210, 0.1);
      padding: 0.2rem 0.8rem;
      border-radius: 40px;
      align-self: flex-start;
      border: 1px solid rgba(60, 130, 210, 0.1);
    }

    /* bottom statistic bar */
    .stats-bar {
      margin-top: 3.4rem;
      padding-top: 1.8rem;
      border-top: 1px solid rgba(255, 255, 255, 0.04);
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 1.2rem;
    }

    .stat-item {
      display: flex;
      align-items: center;
      gap: 0.6rem;
      color: #b6d0e7;
      font-size: 0.9rem;
    }

    .stat-item i {
      color: #56b3ff;
      font-size: 1rem;
      opacity: 0.7;
    }

    .stat-item strong {
      font-weight: 500;
      color: #e1effa;
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
      .glass-panel {
        padding: 2rem 1.8rem;
        border-radius: 2.5rem;
      }
    }

    @media (max-width: 600px) {
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
    }

    /* extra glow for icons */
    .fa-regular, .fas, .fab {
      transition: all 0.2s;
    }
    .feature-card:hover i {
      color: #9bd6ff;
    }

    /* scrollbar */
    ::-webkit-scrollbar {
      width: 4px;
      background: #141a26;
    }
    ::-webkit-scrollbar-thumb {
      background: #3d7bb3;
      border-radius: 10px;
    }
  </style>
</head>
<body>
  <div class="glass-panel">
    <div class="panel-content">

      <!-- top bar -->
      <div class="top-bar">
        <div class="brand">
          <i class="fas fa-bolt"></i>
          <h1>NOVA</h1>
        </div>
        <div class="live-clock" id="clockDisplay">
          <i class="fas fa-circle" style="color: #6fcbff; font-size: 0.6rem;"></i>
          <span id="clockText">00:00:00</span>
        </div>
      </div>

      <!-- main grid -->
      <div class="main-grid">
        <!-- left column -->
        <div class="hero-text">
          <div class="badge"><i class="fas fa-arrow-trend-up" style="margin-right: 6px;"></i> next‑gen interface</div>
          <h2>Build smarter <br><span>with dynamic</span> flows</h2>
          <p>Explore a fresh take on dashboard layouts. Clean, modular, and ready for your data.</p>
          <div class="action-buttons">
            <button class="btn-primary"><i class="fas fa-rocket"></i> Launch</button>
            <button class="btn-secondary"><i class="fas fa-code"></i> Docs</button>
          </div>
        </div>

        <!-- right column: feature cards -->
        <div class="feature-grid">
          <div class="feature-card">
            <i class="fas fa-chart-pie"></i>
            <h4>Analytics</h4>
            <p>Real‑time metrics with interactive filters.</p>
            <span class="tag"><i class="far fa-clock"></i> live</span>
          </div>
          <div class="feature-card">
            <i class="fas fa-cloud-upload-alt"></i>
            <h4>Sync</h4>
            <p>Seamless integration across all devices.</p>
            <span class="tag"><i class="fas fa-check-circle"></i> active</span>
          </div>
          <div class="feature-card">
            <i class="fas fa-shield-alt"></i>
            <h4>Privacy</h4>
            <p>End‑to‑end encryption by default.</p>
            <span class="tag"><i class="fas fa-lock"></i> secure</span>
          </div>
          <div class="feature-card">
            <i class="fas fa-bolt"></i>
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
  </div> <!-- /glass-panel -->

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

    // small extra: console greeting
    console.log('🌟 NOVA · dynamic interface ready');
  </script>
</body>
</html>
