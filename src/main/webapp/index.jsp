<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>FlowBoard · task manager</title>
    <!-- fonts & icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400..600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #f5f4f0;
            --card: #ffffff;
            --text: #1c1c28;
            --text-muted: #5e5e72;
            --accent: #6c5b7b;
            --accent-light: #e4dcec;
            --accent-dark: #4f405c;
            --border: #e3dfd8;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
            --shadow-hover: 0 12px 32px rgba(0, 0, 0, 0.07);
            --radius: 18px;
            --radius-sm: 10px;
            --container: 1120px;
            --transition: 0.2s ease;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        .container {
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 20px;
        }

        button {
            font-family: inherit;
            cursor: pointer;
            border: none;
            background: none;
            color: inherit;
        }

        input,
        textarea {
            font-family: inherit;
        }

        /* ----- header ----- */
        header {
            background: rgba(255, 255, 255, 0.86);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 50;
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 14px 0;
            flex-wrap: wrap;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 700;
            font-size: 1.3rem;
            letter-spacing: -0.3px;
        }

        .brand i {
            color: var(--accent);
            font-size: 1.5rem;
        }

        .brand .accent {
            color: var(--accent);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 22px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: var(--transition);
            border: 2px solid transparent;
        }

        .btn-primary {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }

        .btn-primary:hover {
            background: var(--accent-dark);
            border-color: var(--accent-dark);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(108, 91, 123, 0.25);
        }

        .btn-outline {
            background: transparent;
            color: var(--text);
            border-color: var(--border);
        }

        .btn-outline:hover {
            background: var(--border);
        }

        .btn-danger {
            background: #d45a5a;
            color: #fff;
            border-color: #d45a5a;
        }

        .btn-danger:hover {
            background: #b54444;
            border-color: #b54444;
        }

        .btn-sm {
            padding: 6px 16px;
            font-size: 0.8rem;
        }

        /* ----- stats ----- */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin: 24px 0 28px;
        }

        .stat-card {
            background: var(--card);
            border-radius: var(--radius);
            padding: 18px 20px;
            box-shadow: var(--shadow);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            gap: 14px;
            transition: var(--transition);
        }

        .stat-card:hover {
            box-shadow: var(--shadow-hover);
        }

        .stat-card .icon {
            width: 44px;
            height: 44px;
            border-radius: 60px;
            background: var(--accent-light);
            display: grid;
            place-items: center;
            color: var(--accent);
            font-size: 1.2rem;
        }

        .stat-card .info .num {
            font-weight: 700;
            font-size: 1.4rem;
        }

        .stat-card .info .label {
            color: var(--text-muted);
            font-size: 0.8rem;
        }

        /* ----- task controls ----- */
        .task-controls {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .task-controls .search-wrap {
            display: flex;
            align-items: center;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 60px;
            padding: 0 16px;
            flex: 1;
            min-width: 180px;
            transition: var(--transition);
        }

        .task-controls .search-wrap:focus-within {
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(108, 91, 123, 0.08);
        }

        .task-controls .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            padding: 12px 0;
            width: 100%;
            font-size: 0.9rem;
            color: var(--text);
        }

        .task-controls .search-wrap input::placeholder {
            color: var(--text-muted);
        }

        .task-controls .search-wrap button {
            padding: 8px 0 8px 8px;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .task-controls .search-wrap button:hover {
            color: var(--accent);
        }

        .filter-group {
            display: flex;
            gap: 6px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 8px 18px;
            border-radius: 60px;
            font-weight: 500;
            font-size: 0.85rem;
            background: var(--card);
            border: 1px solid var(--border);
            transition: var(--transition);
            color: var(--text-muted);
        }

        .filter-btn:hover {
            border-color: var(--accent);
            color: var(--text);
        }

        .filter-btn.active {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }

        /* ----- task list ----- */
        .task-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 8px;
        }

        .task-item {
            background: var(--card);
            border-radius: var(--radius-sm);
            padding: 16px 20px;
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            gap: 14px;
            transition: var(--transition);
            box-shadow: var(--shadow);
        }

        .task-item:hover {
            border-color: var(--accent-light);
            box-shadow: var(--shadow-hover);
        }

        .task-item .check {
            width: 24px;
            height: 24px;
            border-radius: 60px;
            border: 2px solid var(--border);
            display: grid;
            place-items: center;
            flex-shrink: 0;
            transition: var(--transition);
            background: #fff;
        }

        .task-item .check.done {
            background: var(--accent);
            border-color: var(--accent);
            color: #fff;
        }

        .task-item .task-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .task-item .task-body .title {
            font-weight: 600;
            font-size: 0.95rem;
        }

        .task-item .task-body .title.done {
            text-decoration: line-through;
            color: var(--text-muted);
        }

        .task-item .task-body .meta {
            display: flex;
            gap: 12px;
            font-size: 0.75rem;
            color: var(--text-muted);
        }

        .task-item .task-body .meta i {
            margin-right: 4px;
        }

        .task-item .task-actions {
            display: flex;
            gap: 6px;
            flex-shrink: 0;
        }

        .task-item .task-actions button {
            width: 34px;
            height: 34px;
            border-radius: 60px;
            display: grid;
            place-items: center;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .task-item .task-actions button:hover {
            background: var(--border);
            color: var(--text);
        }

        .task-item .task-actions .delete-btn:hover {
            background: #fde8e8;
            color: #d45a5a;
        }

        .priority-badge {
            font-size: 0.65rem;
            font-weight: 600;
            padding: 2px 12px;
            border-radius: 60px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            background: var(--border);
            color: var(--text-muted);
        }

        .priority-badge.high {
            background: #fde8e8;
            color: #b54444;
        }

        .priority-badge.medium {
            background: #fff0d6;
            color: #b27a2e;
        }

        .priority-badge.low {
            background: #dff0e6;
            color: #2e7d5e;
        }

        /* ----- modal / add task ----- */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(4px);
            z-index: 200;
            place-items: center;
            padding: 20px;
        }

        .modal-overlay.open {
            display: grid;
        }

        .modal {
            background: var(--card);
            max-width: 480px;
            width: 100%;
            border-radius: var(--radius);
            padding: 32px 28px;
            box-shadow: 0 32px 64px rgba(0, 0, 0, 0.12);
            animation: modalIn 0.2s ease;
        }

        @keyframes modalIn {
            from {
                opacity: 0;
                transform: scale(0.96);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .modal .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal .modal-header h3 {
            font-size: 1.3rem;
        }

        .modal .modal-header .close-btn {
            width: 36px;
            height: 36px;
            border-radius: 60px;
            display: grid;
            place-items: center;
            transition: var(--transition);
            color: var(--text-muted);
        }

        .modal .modal-header .close-btn:hover {
            background: var(--border);
        }

        .modal label {
            font-weight: 500;
            font-size: 0.85rem;
            display: block;
            margin-bottom: 4px;
            color: var(--text);
        }

        .modal input,
        .modal select,
        .modal textarea {
            width: 100%;
            padding: 12px 14px;
            border-radius: var(--radius-sm);
            border: 1px solid var(--border);
            background: var(--bg);
            font-size: 0.9rem;
            margin-bottom: 14px;
            transition: var(--transition);
            color: var(--text);
        }

        .modal input:focus,
        .modal select:focus,
        .modal textarea:focus {
            outline: 2px solid var(--accent);
            border-color: transparent;
        }

        .modal textarea {
            min-height: 70px;
            resize: vertical;
        }

        .modal .form-row {
            display: flex;
            gap: 12px;
        }

        .modal .form-row>* {
            flex: 1;
        }

        .modal .modal-footer {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 6px;
        }

        /* ----- empty state ----- */
        .empty-state {
            text-align: center;
            padding: 48px 20px;
            color: var(--text-muted);
        }

        .empty-state i {
            font-size: 2.8rem;
            color: var(--border);
            margin-bottom: 12px;
        }

        .empty-state h4 {
            font-size: 1.1rem;
            color: var(--text);
            margin-bottom: 4px;
        }

        /* ----- responsive ----- */
        @media (max-width: 820px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .header-inner {
                flex-direction: column;
                align-items: stretch;
                gap: 8px;
            }
            .header-actions {
                justify-content: space-between;
            }
            .task-controls {
                flex-direction: column;
            }
            .task-controls .search-wrap {
                min-width: unset;
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }
            .stat-card {
                padding: 14px;
            }
            .stat-card .icon {
                width: 36px;
                height: 36px;
                font-size: 1rem;
            }
            .stat-card .info .num {
                font-size: 1.1rem;
            }
            .task-item {
                flex-wrap: wrap;
                padding: 14px;
            }
            .task-item .task-actions {
                margin-left: auto;
            }
            .modal {
                padding: 24px 18px;
            }
            .modal .form-row {
                flex-direction: column;
                gap: 0;
            }
            .brand {
                font-size: 1.1rem;
            }
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <header>
        <div class="container header-inner">
            <div class="brand">
                <i class="fas fa-check-circle"></i>
                <span>Flow<span class="accent">Board</span></span>
            </div>
            <div class="header-actions">
                <button class="btn btn-primary" id="openAddTask"><i class="fas fa-plus"></i> New task</button>
                <button class="btn btn-outline" id="clearCompletedBtn"><i class="fas fa-trash-alt"></i> Clear done</button>
            </div>
        </div>
    </header>

    <!-- MAIN -->
    <main class="container">

        <!-- STATS -->
        <div class="stats-grid" id="statsGrid">
            <div class="stat-card">
                <div class="icon"><i class="fas fa-list-ul"></i></div>
                <div class="info"><div class="num" id="totalTasks">0</div><div class="label">Total</div></div>
            </div>
            <div class="stat-card">
                <div class="icon"><i class="fas fa-circle-check"></i></div>
                <div class="info"><div class="num" id="completedTasks">0</div><div class="label">Completed</div></div>
            </div>
            <div class="stat-card">
                <div class="icon"><i class="fas fa-clock"></i></div>
                <div class="info"><div class="num" id="pendingTasks">0</div><div class="label">Pending</div></div>
            </div>
            <div class="stat-card">
                <div class="icon"><i class="fas fa-flag"></i></div>
                <div class="info"><div class="num" id="highPriorityCount">0</div><div class="label">High priority</div></div>
            </div>
        </div>

        <!-- CONTROLS -->
        <div class="task-controls">
            <div class="search-wrap">
                <input type="text" id="searchInput" placeholder="Search tasks..." aria-label="Search" />
                <button id="searchBtn"><i class="fas fa-search"></i></button>
            </div>
            <div class="filter-group" id="filterGroup">
                <button class="filter-btn active" data-filter="all">All</button>
                <button class="filter-btn" data-filter="active">Active</button>
                <button class="filter-btn" data-filter="done">Done</button>
                <button class="filter-btn" data-filter="high">High</button>
            </div>
        </div>

        <!-- TASK LIST -->
        <div class="task-list" id="taskList"></div>

    </main>

    <!-- ADD / EDIT MODAL -->
    <div class="modal-overlay" id="taskModal">
        <div class="modal">
            <div class="modal-header">
                <h3 id="modalTitle">New task</h3>
                <button class="close-btn" id="closeModal"><i class="fas fa-times"></i></button>
            </div>
            <form id="taskForm" onsubmit="return false;">
                <label for="taskTitle">Title</label>
                <input type="text" id="taskTitle" placeholder="Write a task..." required />

                <label for="taskDesc">Description (optional)</label>
                <textarea id="taskDesc" placeholder="Add details…"></textarea>

                <div class="form-row">
                    <div>
                        <label for="taskPriority">Priority</label>
                        <select id="taskPriority">
                            <option value="low">Low</option>
                            <option value="medium" selected>Medium</option>
                            <option value="high">High</option>
                        </select>
                    </div>
                    <div>
                        <label for="taskDue">Due date</label>
                        <input type="date" id="taskDue" />
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-outline" id="cancelModal">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="saveTaskBtn"><i class="fas fa-save"></i> Save</button>
                </div>
            </form>
        </div>
    </div>

    <!-- SCRIPT -->
    <script>
        // ============================================================
        // DATA
        // ============================================================
        let tasks = [];
        let currentFilter = 'all';
        let editingId = null;

        // ============================================================
        // DOM REFS
        // ============================================================
        const taskList = document.getElementById('taskList');
        const totalEl = document.getElementById('totalTasks');
        const completedEl = document.getElementById('completedTasks');
        const pendingEl = document.getElementById('pendingTasks');
        const highPriorityEl = document.getElementById('highPriorityCount');

        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const filterGroup = document.getElementById('filterGroup');
        const modal = document.getElementById('taskModal');
        const modalTitle = document.getElementById('modalTitle');
        const taskForm = document.getElementById('taskForm');
        const taskTitle = document.getElementById('taskTitle');
        const taskDesc = document.getElementById('taskDesc');
        const taskPriority = document.getElementById('taskPriority');
        const taskDue = document.getElementById('taskDue');
        const saveBtn = document.getElementById('saveTaskBtn');
        const closeModal = document.getElementById('closeModal');
        const cancelModal = document.getElementById('cancelModal');
        const openAddBtn = document.getElementById('openAddTask');
        const clearCompletedBtn = document.getElementById('clearCompletedBtn');

        // ============================================================
        // HELPERS
        // ============================================================
        function generateId() { return Date.now() + Math.random().toString(36).slice(2, 6); }

        function formatDate(dateStr) {
            if (!dateStr) return '';
            const d = new Date(dateStr + 'T00:00:00');
            return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
        }

        function getPriorityLabel(p) {
            return p.charAt(0).toUpperCase() + p.slice(1);
        }

        // ============================================================
        // RENDER
        // ============================================================
        function render() {
            const searchTerm = searchInput.value.trim().toLowerCase();
            let filtered = tasks;

            // filter
            if (currentFilter === 'active') filtered = filtered.filter(t => !t.done);
            else if (currentFilter === 'done') filtered = filtered.filter(t => t.done);
            else if (currentFilter === 'high') filtered = filtered.filter(t => t.priority === 'high');

            // search
            if (searchTerm) {
                filtered = filtered.filter(t =>
                    t.title.toLowerCase().includes(searchTerm) ||
                    (t.description && t.description.toLowerCase().includes(searchTerm))
                );
            }

            // sort: pending first, then by priority high→low, then by date
            filtered.sort((a, b) => {
                if (a.done !== b.done) return a.done ? 1 : -1;
                const order = { high: 0, medium: 1, low: 2 };
                if (order[a.priority] !== order[b.priority]) return order[a.priority] - order[b.priority];
                return new Date(a.created) - new Date(b.created);
            });

            // render list
            if (filtered.length === 0) {
                taskList.innerHTML = `
                    <div class="empty-state">
                        <i class="fas fa-inbox"></i>
                        <h4>No tasks here</h4>
                        <p>Add a new task to get started.</p>
                    </div>
                `;
            } else {
                taskList.innerHTML = filtered.map(t => `
                    <div class="task-item" data-id="${t.id}">
                        <button class="check ${t.done ? 'done' : ''}" data-id="${t.id}" aria-label="toggle done">
                            ${t.done ? '<i class="fas fa-check"></i>' : ''}
                        </button>
                        <div class="task-body">
                            <div class="title ${t.done ? 'done' : ''}">${escapeHtml(t.title)}</div>
                            <div class="meta">
                                ${t.description ? `<span><i class="fas fa-align-left"></i> ${escapeHtml(t.description)}</span>` : ''}
                                <span><i class="fas fa-flag"></i> ${getPriorityLabel(t.priority)}</span>
                                ${t.due ? `<span><i class="far fa-calendar-alt"></i> ${formatDate(t.due)}</span>` : ''}
                                ${t.done ? '<span style="color:#2e7d5e;"><i class="fas fa-check-circle"></i> Done</span>' : ''}
                            </div>
                        </div>
                        <div class="task-actions">
                            <button class="edit-btn" data-id="${t.id}" aria-label="edit"><i class="fas fa-pen"></i></button>
                            <button class="delete-btn" data-id="${t.id}" aria-label="delete"><i class="fas fa-trash-can"></i></button>
                        </div>
                    </div>
                `).join('');
            }

            // update stats
            const total = tasks.length;
            const completed = tasks.filter(t => t.done).length;
            const pending = total - completed;
            const high = tasks.filter(t => t.priority === 'high').length;

            totalEl.textContent = total;
            completedEl.textContent = completed;
            pendingEl.textContent = pending;
            highPriorityEl.textContent = high;

            // attach events
            document.querySelectorAll('.check').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    toggleTask(btn.dataset.id);
                });
            });

            document.querySelectorAll('.edit-btn').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    openEdit(btn.dataset.id);
                });
            });

            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    deleteTask(btn.dataset.id);
                });
            });
        }

        function escapeHtml(text) {
            if (!text) return '';
            return String(text).replace(/[&<>"]/g, s => ({
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;'
            } [s]));
        }

        // ============================================================
        // CRUD
        // ============================================================
        function addTask(title, description, priority, due) {
            tasks.push({
                id: generateId(),
                title: title.trim(),
                description: description.trim(),
                priority: priority || 'medium',
                due: due || '',
                done: false,
                created: new Date().toISOString()
            });
            render();
        }

        function toggleTask(id) {
            const task = tasks.find(t => t.id === id);
            if (task) {
                task.done = !task.done;
                render();
            }
        }

        function deleteTask(id) {
            if (confirm('Delete this task?')) {
                tasks = tasks.filter(t => t.id !== id);
                render();
            }
        }

        function clearCompleted() {
            const hasDone = tasks.some(t => t.done);
            if (!hasDone) return alert('No completed tasks to clear.');
            if (confirm('Remove all completed tasks?')) {
                tasks = tasks.filter(t => !t.done);
                render();
            }
        }

        function openEdit(id) {
            const task = tasks.find(t => t.id === id);
            if (!task) return;
            editingId = id;
            modalTitle.textContent = 'Edit task';
            taskTitle.value = task.title;
            taskDesc.value = task.description || '';
            taskPriority.value = task.priority;
            taskDue.value = task.due || '';
            saveBtn.textContent = 'Update';
            modal.classList.add('open');
        }

        function resetModal() {
            editingId = null;
            modalTitle.textContent = 'New task';
            taskTitle.value = '';
            taskDesc.value = '';
            taskPriority.value = 'medium';
            taskDue.value = '';
            saveBtn.textContent = 'Save';
            modal.classList.remove('open');
        }

        // ============================================================
        // EVENTS
        // ============================================================
        // open add
        openAddBtn.addEventListener('click', () => {
            resetModal();
            modal.classList.add('open');
        });

        // close modal
        closeModal.addEventListener('click', resetModal);
        cancelModal.addEventListener('click', resetModal);
        modal.addEventListener('click', (e) => {
            if (e.target === modal) resetModal();
        });

        // save task
        taskForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const title = taskTitle.value.trim();
            if (!title) return alert('Please enter a title.');

            if (editingId) {
                const task = tasks.find(t => t.id === editingId);
                if (task) {
                    task.title = title;
                    task.description = taskDesc.value.trim();
                    task.priority = taskPriority.value;
                    task.due = taskDue.value;
                }
                render();
                resetModal();
            } else {
                addTask(title, taskDesc.value.trim(), taskPriority.value, taskDue.value);
                resetModal();
            }
        });

        // search
        searchBtn.addEventListener('click', () => render());
        searchInput.addEventListener('keydown', (e) => { if (e.key === 'Enter') render(); });

        // filters
        filterGroup.addEventListener('click', (e) => {
            const btn = e.target.closest('.filter-btn');
            if (!btn) return;
            filterGroup.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            currentFilter = btn.dataset.filter;
            render();
        });

        // clear completed
        clearCompletedBtn.addEventListener('click', clearCompleted);

        // keyboard shortcut: Escape closes modal
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && modal.classList.contains('open')) resetModal();
        });

        // ============================================================
        // INIT – seed with sample tasks
        // ============================================================
        const sampleTasks = [
            { title: 'Design homepage mockup', description: 'Figma — dark mode variant', priority: 'high',
                due: '2026-09-10' },
            { title: 'Review Q3 performance', description: 'Prepare slides for team meeting', priority: 'medium',
                due: '2026-09-15' },
            { title: 'Update project roadmap', description: 'Include new milestones', priority: 'medium',
            due: '2026-09-08' },
            { title: 'Write monthly newsletter', description: 'Draft content + schedule', priority: 'low',
            due: '2026-09-20' },
            { title: 'Refactor auth module', description: 'Improve token handling', priority: 'high', due: '2026-09-12' },
        ];

        sampleTasks.forEach(t => {
            tasks.push({
                id: generateId(),
                title: t.title,
                description: t.description,
                priority: t.priority,
                due: t.due,
                done: false,
                created: new Date().toISOString()
            });
        });

        render();
        console.log('📋 FlowBoard – task manager ready.');
    </script>

</body>
</html>
