<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Aurora Tasks – a calm, friendly task manager.">
  <title>Aurora Tasks · Stay on top of your day</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

  <style>
    :root {
      /* Warm palette – peach, coral, lavender */
      --bg-1: #fff5f0;
      --bg-2: #f5f0ff;
      --surface: #ffffff;
      --surface-2: #fdf9ff;
      --ink: #2b2340;
      --ink-soft: #5b5273;
      --ink-muted: #8a819c;
      --coral: #ff6b6b;
      --coral-soft: #ffe4e1;
      --peach: #ffb088;
      --lavender: #a78bfa;
      --lavender-soft: #ede9fe;
      --mint: #4ade80;
      --mint-soft: #dcfce7;
      --amber: #fbbf24;
      --amber-soft: #fef3c7;
      --line: #ece6f5;
      --line-strong: #ddd3ec;
      --shadow-sm: 0 2px 6px rgba(80, 50, 120, 0.05);
      --shadow-md: 0 10px 24px -10px rgba(80, 50, 120, 0.15);
      --shadow-lg: 0 24px 48px -20px rgba(80, 50, 120, 0.25);
      --radius-sm: 10px;
      --radius-md: 16px;
      --radius-lg: 24px;
      --radius-pill: 999px;
      --focus: 3px solid #7c3aed;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { -webkit-text-size-adjust: 100%; scroll-behavior: smooth; }

    body {
      min-height: 100vh;
      font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
      color: var(--ink);
      background: linear-gradient(135deg, var(--bg-1) 0%, var(--bg-2) 100%);
      line-height: 1.55;
      padding: 1.25rem;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .skip-link {
      position: absolute; top: -100px; left: 1rem;
      background: var(--ink); color: #fff;
      padding: 0.75rem 1.25rem; border-radius: var(--radius-sm);
      text-decoration: none; font-weight: 600; z-index: 100;
    }
    .skip-link:focus { top: 1rem; }

    :focus-visible {
      outline: var(--focus);
      outline-offset: 3px;
      border-radius: var(--radius-sm);
    }

    /* ============ SHELL ============ */
    .shell {
      width: 100%;
      max-width: 1200px;
      background: var(--surface);
      border-radius: var(--radius-lg);
      box-shadow: var(--shadow-lg);
      display: grid;
      grid-template-columns: 260px 1fr;
      overflow: hidden;
      min-height: 620px;
    }

    /* ============ SIDEBAR ============ */
    .sidebar {
      background: var(--surface-2);
      border-right: 1px solid var(--line);
      padding: 2rem 1.5rem;
      display: flex;
      flex-direction: column;
      gap: 1.75rem;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 0.65rem;
      text-decoration: none;
      color: var(--ink);
    }

    .brand-mark {
      width: 40px; height: 40px;
      border-radius: 12px;
      background: linear-gradient(135deg, var(--coral), var(--lavender));
      display: grid; place-items: center;
      color: #fff; font-size: 1.2rem; font-weight: 800;
      box-shadow: 0 6px 14px -6px rgba(255, 107, 107, 0.6);
      flex-shrink: 0;
    }

    .brand-name {
      font-weight: 800;
      font-size: 1.15rem;
      letter-spacing: -0.02em;
    }
    .brand-name small {
      display: block;
      font-size: 0.7rem;
      font-weight: 500;
      color: var(--ink-muted);
      letter-spacing: 0.02em;
    }

    .nav {
      display: flex;
      flex-direction: column;
      gap: 0.3rem;
      list-style: none;
    }

    .nav-item {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.7rem 0.9rem;
      border-radius: var(--radius-sm);
      color: var(--ink-soft);
      text-decoration: none;
      font-weight: 500;
      font-size: 0.94rem;
      transition: background-color 0.15s ease, color 0.15s ease;
      min-height: 44px;
    }
    .nav-item i {
      width: 20px;
      text-align: center;
      font-size: 1rem;
    }
    .nav-item:hover {
      background: #f3ecfb;
      color: var(--ink);
    }
    .nav-item[aria-current="page"] {
      background: var(--lavender-soft);
      color: #5b21b6;
      font-weight: 700;
    }

    .nav-item .count {
      margin-left: auto;
      background: var(--coral-soft);
      color: #b91c1c;
      font-size: 0.7rem;
      font-weight: 700;
      padding: 0.15rem 0.5rem;
      border-radius: var(--radius-pill);
    }

    .sidebar-footer {
      margin-top: auto;
      padding-top: 1.5rem;
      border-top: 1px solid var(--line);
      font-size: 0.8rem;
      color: var(--ink-muted);
    }

    .user-chip {
      display: flex;
      align-items: center;
      gap: 0.6rem;
      margin-bottom: 0.75rem;
    }

    .avatar {
      width: 36px; height: 36px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--peach), var(--coral));
      display: grid; place-items: center;
      color: #fff; font-weight: 700; font-size: 0.85rem;
      flex-shrink: 0;
    }
    .user-chip strong { font-size: 0.88rem; color: var(--ink); display: block; }
    .user-chip span { font-size: 0.75rem; color: var(--ink-muted); }

    /* ============ MAIN ============ */
    .main {
      padding: 2rem 2.25rem;
      display: flex;
      flex-direction: column;
      gap: 1.75rem;
      overflow-y: auto;
    }

    .main-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 1rem;
      flex-wrap: wrap;
    }

    .greeting h1 {
      font-size: clamp(1.4rem, 2.4vw, 1.85rem);
      font-weight: 800;
      letter-spacing: -0.025em;
      color: var(--ink);
      margin-bottom: 0.2rem;
    }
    .greeting p {
      color: var(--ink-muted);
      font-size: 0.92rem;
    }

    .btn {
      font-family: inherit;
      font-size: 0.92rem;
      font-weight: 600;
      padding: 0.7rem 1.3rem;
      border-radius: var(--radius-pill);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      cursor: pointer;
      border: none;
      min-height: 44px;
      transition: transform 0.15s ease, box-shadow 0.15s ease,
                  background-color 0.15s ease;
      text-decoration: none;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--coral), #f97316);
      color: #fff;
      box-shadow: 0 8px 20px -8px rgba(255, 107, 107, 0.7);
    }
    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 24px -8px rgba(255, 107, 107, 0.8);
    }
    .btn-primary:active { transform: translateY(0); }

    /* ============ PROGRESS CARD ============ */
    .progress-card {
      background: linear-gradient(135deg, #fff5f0 0%, #f5f0ff 100%);
      border: 1px solid var(--line);
      border-radius: var(--radius-md);
      padding: 1.5rem 1.75rem;
      display: grid;
      grid-template-columns: auto 1fr;
      gap: 1.5rem;
      align-items: center;
    }

    .ring {
      width: 96px; height: 96px;
      flex-shrink: 0;
    }
    .ring circle {
      fill: none;
      stroke-width: 9;
      stroke-linecap: round;
      transform: rotate(-90deg);
      transform-origin: 50% 50%;
    }
    .ring .bg { stroke: #eadcf3; }
    .ring .fg {
      stroke: url(#ringGradient);
      stroke-dasharray: 251.2;
      stroke-dashoffset: 75.4;
      transition: stroke-dashoffset 0.9s cubic-bezier(0.2, 0.9, 0.3, 1);
    }
    .ring-wrap { position: relative; display: grid; place-items: center; }
    .ring-label {
      position: absolute;
      font-weight: 800;
      font-size: 1.05rem;
      color: var(--ink);
    }

    .progress-text h2 {
      font-size: 1.1rem;
      font-weight: 700;
      color: var(--ink);
      margin-bottom: 0.3rem;
    }
    .progress-text p {
      color: var(--ink-soft);
      font-size: 0.9rem;
      margin-bottom: 0.85rem;
    }

    .mini-stats {
      display: flex;
      gap: 1.5rem;
      flex-wrap: wrap;
    }
    .mini-stat strong {
      display: block;
      font-size: 1.15rem;
      font-weight: 800;
      color: var(--ink);
    }
    .mini-stat span {
      font-size: 0.75rem;
      color: var(--ink-muted);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      font-weight: 600;
    }

    /* ============ SECTION HEAD ============ */
    .section-head {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0.85rem;
    }
    .section-head h2 {
      font-size: 1.05rem;
      font-weight: 700;
      color: var(--ink);
    }
    .section-head a {
      font-size: 0.82rem;
      color: #7c3aed;
      font-weight: 600;
      text-decoration: none;
    }
    .section-head a:hover { text-decoration: underline; }

    /* ============ TASK LIST ============ */
    .task-list {
      list-style: none;
      display: flex;
      flex-direction: column;
      gap: 0.6rem;
    }

    .task {
      display: grid;
      grid-template-columns: auto 1fr auto;
      gap: 0.9rem;
      align-items: center;
      padding: 0.9rem 1.1rem;
      background: var(--surface);
      border: 1px solid var(--line);
      border-radius: var(--radius-md);
      transition: border-color 0.15s ease, box-shadow 0.15s ease,
                  background-color 0.15s ease;
    }
    .task:hover {
      border-color: var(--line-strong);
      box-shadow: var(--shadow-sm);
    }
    .task:has(input:checked) {
      background: var(--surface-2);
      opacity: 0.75;
    }
    .task:has(input:checked) .task-title {
      text-decoration: line-through;
      color: var(--ink-muted);
    }

    /* Custom checkbox */
    .check {
      position: relative;
      display: inline-grid;
      place-items: center;
      width: 24px; height: 24px;
      flex-shrink: 0;
      cursor: pointer;
    }
    .check input {
      position: absolute;
      opacity: 0;
      width: 100%; height: 100%;
      cursor: pointer;
      margin: 0;
    }
    .check .box {
      width: 22px; height: 22px;
      border: 2px solid var(--line-strong);
      border-radius: 7px;
      display: grid;
      place-items: center;
      background: #fff;
      transition: all 0.15s ease;
      color: transparent;
      font-size: 0.7rem;
    }
    .check input:checked + .box {
      background: linear-gradient(135deg, var(--mint), #22c55e);
      border-color: var(--mint);
      color: #fff;
    }
    .check input:focus-visible + .box {
      outline: var(--focus);
      outline-offset: 3px;
    }

    .task-body { min-width: 0; }
    .task-title {
      font-weight: 600;
      font-size: 0.95rem;
      color: var(--ink);
      margin-bottom: 0.2rem;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    .task-meta {
      display: flex;
      gap: 0.75rem;
      align-items: center;
      font-size: 0.78rem;
      color: var(--ink-muted);
      flex-wrap: wrap;
    }
    .task-meta i { font-size: 0.75rem; }

    /* Priority chips */
    .chip {
      display: inline-flex;
      align-items: center;
      gap: 0.3rem;
      padding: 0.2rem 0.6rem;
      border-radius: var(--radius-pill);
      font-size: 0.7rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.03em;
    }
    .chip.high { background: var(--coral-soft); color: #b91c1c; }
    .chip.medium { background: var(--amber-soft); color: #92400e; }
    .chip.low { background: var(--mint-soft); color: #166534; }

    /* "Add task" input row */
    .add-row {
      display: flex;
      gap: 0.6rem;
      margin-top: 0.4rem;
    }
    .add-row input[type="text"] {
      flex: 1;
      font-family: inherit;
      font-size: 0.92rem;
      padding: 0.75rem 1rem;
      border: 1.5px dashed var(--line-strong);
      border-radius: var(--radius-md);
      background: var(--surface-2);
      color: var(--ink);
      min-height: 44px;
      transition: border-color 0.15s ease, background-color 0.15s ease;
    }
    .add-row input[type="text"]::placeholder { color: var(--ink-muted); }
    .add-row input[type="text"]:focus {
      outline: none;
      border-color: var(--lavender);
      border-style: solid;
      background: #fff;
    }
    .add-row .btn-primary { padding: 0.75rem 1.1rem; }

    /* ============ RESPONSIVE ============ */
    @media (max-width: 860px) {
      .shell { grid-template-columns: 1fr; min-height: auto; }
      .sidebar {
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        padding: 1rem 1.25rem;
        border-right: none;
        border-bottom: 1px solid var(--line);
        gap: 1rem;
        overflow-x: auto;
      }
      .nav {
        flex-direction: row;
        gap: 0.25rem;
      }
      .nav-item span:not(.count) { display: none; }
      .nav-item { padding: 0.6rem; }
      .sidebar-footer { display: none; }
      .main { padding: 1.5rem 1.25rem; }
    }

    @media (max-width: 560px) {
      body { padding: 0.75rem; }
      .progress-card { grid-template-columns: 1fr; text-align: center; }
      .ring-wrap { justify-self: center; }
      .mini-stats { justify-content: center; }
      .main-header { flex-direction: column; align-items: stretch; }
      .main-header .btn { width: 100%; }
      .task { grid-template-columns: auto 1fr; }
      .task .chip { grid-column: 2; justify-self: start; }
    }

    /* ============ REDUCED MOTION ============ */
    @media (prefers-reduced-motion: reduce) {
      *, *::before, *::after {
        animation-duration: 0.001ms !important;
        transition-duration: 0.001ms !important;
        scroll-behavior: auto !important;
      }
      .btn:hover, .task:hover { transform: none; }
    }
  </style>
</head>
<body>

  <a class="skip-link" href="#main">Skip to tasks</a>

  <div class="shell">

    <!-- ========== SIDEBAR ========== -->
    <aside class="sidebar" aria-label="Main navigation">
      <a href="#" class="brand">
        <div class="brand-mark" aria-hidden="true">A</div>
        <div class="brand-name">
          Aurora
          <small>Tasks</small>
        </div>
      </a>

      <nav>
        <ul class="nav">
          <li>
            <a class="nav-item" href="#" aria-current="page">
              <i class="fa-solid fa-house" aria-hidden="true"></i>
              <span>Today</span>
              <span class="count">3</span>
            </a>
          </li>
          <li>
            <a class="nav-item" href="#">
              <i class="fa-solid fa-calendar-day" aria-hidden="true"></i>
              <span>Upcoming</span>
            </a>
          </li>
          <li>
            <a class="nav-item" href="#">
              <i class="fa-solid fa-inbox" aria-hidden="true"></i>
              <span>Inbox</span>
            </a>
          </li>
          <li>
            <a class="nav-item" href="#">
              <i class="fa-solid fa-check-double" aria-hidden="true"></i>
              <span>Completed</span>
            </a>
          </li>
          <li>
            <a class="nav-item" href="#">
              <i class="fa-solid fa-chart-simple" aria-hidden="true"></i>
              <span>Insights</span>
            </a>
          </li>
        </ul>
      </nav>

      <div class="sidebar-footer">
        <div class="user-chip">
          <div class="avatar" aria-hidden="true">MK</div>
          <div>
            <strong>Maya K.</strong>
            <span>Free plan</span>
          </div>
        </div>
        <a href="#" style="color:#7c3aed; font-weight:600; text-decoration:none; font-size:0.8rem;">Upgrade →</a>
      </div>
    </aside>

    <!-- ========== MAIN ========== -->
    <main id="main" class="main">

      <header class="main-header">
        <div class="greeting">
          <h1>Good morning, Maya 🌤️</h1>
          <p>You have <strong>5 tasks</strong> today — 2 done, 3 to go.</p>
        </div>
        <button class="btn btn-primary" type="button">
          <i class="fa-solid fa-plus" aria-hidden="true"></i>
          New task
        </button>
      </header>

      <!-- Progress -->
      <section class="progress-card" aria-labelledby="progress-title">
        <div class="ring-wrap">
          <svg class="ring" viewBox="0 0 100 100" role="img" aria-label="70 percent of today's tasks complete">
            <defs>
              <linearGradient id="ringGradient" x1="0" y1="0" x2="1" y2="1">
                <stop offset="0%" stop-color="#ff6b6b"/>
                <stop offset="100%" stop-color="#a78bfa"/>
              </linearGradient>
            </defs>
            <circle class="bg" cx="50" cy="50" r="40"/>
            <circle class="fg" cx="50" cy="50" r="40"/>
          </svg>
          <span class="ring-label" aria-hidden="true">70%</span>
        </div>

        <div class="progress-text">
          <h2 id="progress-title">Today's momentum</h2>
          <p>You're doing great — 7 of 10 tasks completed.</p>
          <div class="mini-stats">
            <div class="mini-stat">
              <strong>10</strong>
              <span>Total</span>
            </div>
            <div class="mini-stat">
              <strong>7</strong>
              <span>Done</span>
            </div>
            <div class="mini-stat">
              <strong>3</strong>
              <span>Left</span>
            </div>
          </div>
        </div>
      </section>

      <!-- Task list -->
      <section aria-labelledby="tasks-title">
        <div class="section-head">
          <h2 id="tasks-title">Your tasks</h2>
          <a href="#">View all</a>
        </div>

        <ul class="task-list">

          <li class="task">
            <label class="check">
              <input type="checkbox" checked aria-label="Mark 'Finish Q3 report' as not done">
              <span class="box" aria-hidden="true"><i class="fa-solid fa-check"></i></span>
            </label>
            <div class="task-body">
              <div class="task-title">Finish Q3 report</div>
              <div class="task-meta">
                <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 9:00 AM</span>
                <span class="chip high">High</span>
              </div>
            </div>
          </li>

          <li class="task">
            <label class="check">
              <input type="checkbox" aria-label="Mark 'Design review with team' as done">
              <span class="box" aria-hidden="true"><i class="fa-solid fa-check"></i></span>
            </label>
            <div class="task-body">
              <div class="task-title">Design review with team</div>
              <div class="task-meta">
                <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 11:30 AM</span>
                <span class="chip medium">Medium</span>
              </div>
            </div>
          </li>

          <li class="task">
            <label class="check">
              <input type="checkbox" aria-label="Mark 'Reply to client emails' as done">
              <span class="box" aria-hidden="true"><i class="fa-solid fa-check"></i></span>
            </label>
            <div class="task-body">
              <div class="task-title">Reply to client emails</div>
              <div class="task-meta">
                <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 2:00 PM</span>
                <span class="chip low">Low</span>
              </div>
            </div>
          </li>

          <li class="task">
            <label class="check">
              <input type="checkbox" checked aria-label="Mark 'Update portfolio site' as not done">
              <span class="box" aria-hidden="true"><i class="fa-solid fa-check"></i></span>
            </label>
            <div class="task-body">
              <div class="task-title">Update portfolio site</div>
              <div class="task-meta">
                <span><i class="fa-regular fa-clock" aria-hidden="true"></i> 4:30 PM</span>
                <span class="chip medium">Medium</span>
              </div>
            </div>
          </li>

        </ul>

        <!-- Add task -->
        <form class="add-row" onsubmit="event.preventDefault(); this.reset();">
          <label for="new-task" class="sr-only">Add a new task</label>
          <input id="new-task" type="text" placeholder="Add a new task…" autocomplete="off">
          <button class="btn btn-primary" type="submit">
            <i class="fa-solid fa-plus" aria-hidden="true"></i>
            Add
          </button>
        </form>
      </section>

    </main>
  </div>

  <!-- Font Awesome (icons) -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">

  <style>
    /* Visually hidden helper (used above) */
    .sr-only {
      position: absolute; width: 1px; height: 1px;
      padding: 0; margin: -1px; overflow: hidden;
      clip: rect(0,0,0,0); white-space: nowrap; border: 0;
    }
  </style>

</body>
</html>
