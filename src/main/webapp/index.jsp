<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NexusShop · friendly &amp; modern</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* ----- reset & root ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #f7f6f2;
            --card: #ffffff;
            --text: #1f1f2e;
            --text-muted: #5a5a6e;
            --accent: #d17a5a;
            --accent-soft: #f5e1d8;
            --accent-dark: #b55a3e;
            --border-light: #e8e6e0;
            --shadow: 0 6px 18px rgba(0, 0, 0, 0.04);
            --shadow-hover: 0 16px 40px rgba(0, 0, 0, 0.07);
            --radius: 20px;
            --radius-sm: 12px;
            --container: 1220px;
            --transition: 0.25s ease;
        }

        body {
            font-family: 'Inter', -apple-system, system-ui, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        img {
            display: block;
            max-width: 100%;
        }

        button {
            font-family: inherit;
            cursor: pointer;
            border: none;
            background: none;
            color: inherit;
        }

        .container {
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 20px;
        }

        /* ----- utilities ----- */
        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 28px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.95rem;
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
            box-shadow: 0 10px 24px rgba(209, 122, 90, 0.25);
        }

        .btn-secondary {
            background: var(--text);
            color: #fff;
            border-color: var(--text);
        }

        .btn-secondary:hover {
            background: #2e2e44;
            transform: translateY(-2px);
            box-shadow: 0 10px 24px rgba(0, 0, 0, 0.12);
        }

        .btn-outline-light {
            background: rgba(255, 255, 255, 0.12);
            color: #fff;
            border-color: rgba(255, 255, 255, 0.25);
        }

        .btn-outline-light:hover {
            background: rgba(255, 255, 255, 0.22);
            transform: translateY(-2px);
        }

        .btn-sm {
            padding: 8px 18px;
            font-size: 0.85rem;
        }

        /* ----- header ----- */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 10px 0;
            min-height: 66px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 800;
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

        .nav-links {
            display: flex;
            gap: 2px;
            list-style: none;
        }

        .nav-links a {
            padding: 8px 16px;
            border-radius: var(--radius-sm);
            font-weight: 500;
            font-size: 0.9rem;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .nav-links a:hover,
        .nav-links a.active {
            background: var(--border-light);
            color: var(--text);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .icon-btn {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            border-radius: 60px;
            color: var(--text-muted);
            transition: var(--transition);
            font-size: 1.1rem;
        }

        .icon-btn:hover {
            background: var(--border-light);
            color: var(--text);
        }

        .cart-wrap {
            position: relative;
        }

        .cart-count {
            position: absolute;
            top: -2px;
            right: -2px;
            background: var(--accent);
            color: #fff;
            font-size: 0.7rem;
            font-weight: 700;
            width: 20px;
            height: 20px;
            border-radius: 30px;
            display: grid;
            place-items: center;
            border: 2px solid #fff;
        }

        .search-wrap {
            display: flex;
            align-items: center;
            background: var(--border-light);
            border-radius: 60px;
            padding: 0 12px 0 18px;
            border: 2px solid transparent;
            transition: var(--transition);
            min-width: 180px;
        }

        .search-wrap:focus-within {
            border-color: var(--accent);
            background: #fff;
            box-shadow: 0 0 0 4px rgba(209, 122, 90, 0.08);
        }

        .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            width: 100%;
            padding: 10px 0;
            font-size: 0.9rem;
            color: var(--text);
        }

        .search-wrap input::placeholder {
            color: var(--text-muted);
        }

        .search-wrap button {
            padding: 6px 0 6px 8px;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .search-wrap button:hover {
            color: var(--accent);
        }

        .mobile-toggle {
            display: none;
            width: 42px;
            height: 42px;
            border-radius: 60px;
            background: var(--border-light);
            font-size: 1.2rem;
        }

        #mobileMenu {
            display: none;
            background: #fff;
            border-top: 1px solid var(--border-light);
            padding: 12px 0 18px;
        }

        #mobileMenu ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        #mobileMenu ul a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: var(--radius-sm);
            font-weight: 500;
            color: var(--text);
            transition: var(--transition);
        }

        #mobileMenu ul a:hover {
            background: var(--bg);
        }

        #mobileMenu ul a i {
            width: 24px;
            color: var(--text-muted);
        }

        /* ----- hero ----- */
        .hero {
            position: relative;
            background: linear-gradient(135deg, #1f1f2e 0%, #34344e 100%);
            border-radius: var(--radius);
            margin: 16px 20px 0;
            padding: 56px 0;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
            opacity: 0.25;
            z-index: 0;
        }

        .hero .container {
            position: relative;
            z-index: 1;
        }

        .hero .tag {
            display: inline-block;
            background: rgba(209, 122, 90, 0.18);
            color: var(--accent);
            padding: 4px 18px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.8rem;
            letter-spacing: 0.4px;
            margin-bottom: 14px;
        }

        .hero h1 {
            font-size: 2.8rem;
            font-weight: 700;
            color: #fff;
            line-height: 1.1;
            max-width: 600px;
            margin-bottom: 12px;
        }

        .hero p {
            color: rgba(255, 255, 255, 0.8);
            max-width: 460px;
            margin-bottom: 24px;
            font-size: 1.05rem;
            line-height: 1.6;
        }

        .hero .actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        /* ----- section ----- */
        .section {
            padding: 48px 0;
        }

        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 16px;
            flex-wrap: wrap;
            margin-bottom: 28px;
        }

        .section-header .title-group h2 {
            font-size: 1.7rem;
            font-weight: 700;
            letter-spacing: -0.3px;
        }

        .section-header .title-group p {
            color: var(--text-muted);
            font-size: 0.95rem;
            margin-top: 2px;
        }

        .section-header .view-all {
            font-weight: 600;
            color: var(--accent);
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 0.9rem;
            transition: var(--transition);
            white-space: nowrap;
        }

        .section-header .view-all:hover {
            gap: 12px;
            color: var(--accent-dark);
        }

        /* ----- categories ----- */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 16px;
        }

        .cat-card {
            background: var(--card);
            border-radius: var(--radius);
            padding: 22px 12px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border: 2px solid transparent;
        }

        .cat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-hover);
            border-color: var(--accent-soft);
        }

        .cat-card .icon-wrap {
            width: 54px;
            height: 54px;
            border-radius: 60px;
            background: var(--accent-soft);
            display: grid;
            place-items: center;
            margin: 0 auto 10px;
            font-size: 1.4rem;
            color: var(--accent);
            transition: var(--transition);
        }

        .cat-card:hover .icon-wrap {
            background: var(--accent);
            color: #fff;
        }

        .cat-card h4 {
            font-size: 0.95rem;
            font-weight: 600;
        }

        .cat-card .count {
            font-size: 0.8rem;
            color: var(--text-muted);
            margin-top: 2px;
        }

        /* ----- products ----- */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .product-card {
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border: 2px solid transparent;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-hover);
            border-color: var(--accent-soft);
        }

        .product-card .img-wrap {
            position: relative;
            background: var(--bg);
            aspect-ratio: 1/1;
            overflow: hidden;
        }

        .product-card .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .product-card:hover .img-wrap img {
            transform: scale(1.04);
        }

        .product-card .badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--accent);
            color: #fff;
            padding: 4px 14px;
            border-radius: 60px;
            font-size: 0.7rem;
            font-weight: 700;
        }

        .product-card .badge.sale {
            background: #e9b45a;
            color: var(--text);
        }

        .product-card .wish-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 36px;
            height: 36px;
            border-radius: 60px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(4px);
            display: grid;
            place-items: center;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .product-card .wish-btn:hover {
            background: #fff;
            color: var(--accent);
            transform: scale(1.08);
        }

        .product-card .body {
            padding: 14px 16px 8px;
            flex: 1;
        }

        .product-card .body .category-tag {
            font-size: 0.7rem;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.4px;
        }

        .product-card .body h5 {
            font-size: 1rem;
            font-weight: 600;
            margin: 4px 0 6px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-card .body .price-row {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .product-card .body .price {
            font-weight: 700;
            font-size: 1.1rem;
        }

        .product-card .body .old-price {
            color: var(--text-muted);
            text-decoration: line-through;
            font-size: 0.9rem;
        }

        .product-card .body .rating {
            display: flex;
            align-items: center;
            gap: 4px;
            font-size: 0.8rem;
            color: #f3a84b;
            margin-top: 4px;
        }

        .product-card .body .rating span {
            color: var(--text-muted);
        }

        .product-card .footer {
            padding: 4px 16px 16px;
            display: flex;
            gap: 8px;
        }

        .product-card .footer .add-btn {
            flex: 1;
            padding: 10px;
            border-radius: var(--radius-sm);
            background: var(--text);
            color: #fff;
            font-weight: 600;
            font-size: 0.85rem;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .product-card .footer .add-btn:hover {
            background: var(--accent);
            transform: scale(1.02);
        }

        .product-card .footer .add-btn.added {
            background: #2a9d8f;
        }

        /* ----- deal ----- */
        .deal-wrap {
            display: flex;
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .deal-wrap .deal-img {
            flex: 0 0 46%;
            min-height: 280px;
            background: var(--bg);
        }

        .deal-wrap .deal-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .deal-wrap .deal-content {
            flex: 1;
            padding: 36px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .deal-wrap .deal-content .tag {
            align-self: flex-start;
            background: #e9b45a;
            color: var(--text);
            padding: 4px 16px;
            border-radius: 60px;
            font-weight: 700;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 10px;
        }

        .deal-wrap .deal-content h3 {
            font-size: 1.6rem;
            font-weight: 700;
        }

        .deal-wrap .deal-content .desc {
            color: var(--text-muted);
            margin: 4px 0 12px;
        }

        .deal-wrap .deal-content .price-big {
            font-size: 2rem;
            font-weight: 800;
        }

        .deal-wrap .deal-content .price-big .old {
            font-size: 1.2rem;
            font-weight: 400;
            color: var(--text-muted);
            text-decoration: line-through;
            margin-left: 8px;
        }

        .deal-wrap .deal-content .stock {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin: 4px 0 14px;
        }

        .deal-wrap .deal-content .stock strong {
            color: var(--accent);
        }

        .timer-grid {
            display: flex;
            gap: 12px;
            margin: 12px 0 18px;
        }

        .timer-box {
            background: var(--text);
            color: #fff;
            padding: 10px 16px;
            border-radius: var(--radius-sm);
            min-width: 60px;
            text-align: center;
        }

        .timer-box .num {
            font-size: 1.4rem;
            font-weight: 700;
            line-height: 1.2;
        }

        .timer-box .label {
            font-size: 0.6rem;
            opacity: 0.7;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        /* ----- testimonials ----- */
        .testimonials-scroll {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 8px 4px 16px;
            scroll-snap-type: x mandatory;
            -webkit-overflow-scrolling: touch;
        }

        .testimonials-scroll::-webkit-scrollbar {
            height: 4px;
        }

        .testimonials-scroll::-webkit-scrollbar-thumb {
            background: var(--accent-soft);
            border-radius: 10px;
        }

        .testimonial-card {
            flex: 0 0 300px;
            background: var(--card);
            border-radius: var(--radius);
            padding: 24px 22px;
            box-shadow: var(--shadow);
            scroll-snap-align: start;
            transition: var(--transition);
        }

        .testimonial-card:hover {
            box-shadow: var(--shadow-hover);
        }

        .testimonial-card .stars {
            color: #f3a84b;
            font-size: 0.9rem;
            letter-spacing: 2px;
            margin-bottom: 8px;
        }

        .testimonial-card blockquote {
            font-size: 0.95rem;
            line-height: 1.5;
            font-style: italic;
            margin-bottom: 12px;
        }

        .testimonial-card .author {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .testimonial-card .author .avatar {
            width: 44px;
            height: 44px;
            border-radius: 60px;
            object-fit: cover;
            background: var(--bg);
        }

        .testimonial-card .author .name {
            font-weight: 600;
            font-size: 0.9rem;
        }

        .testimonial-card .author .role {
            font-size: 0.8rem;
            color: var(--text-muted);
        }

        /* ----- newsletter ----- */
        .newsletter-wrap {
            background: linear-gradient(135deg, #1f1f2e, #34344e);
            border-radius: var(--radius);
            padding: 44px 48px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 32px;
            flex-wrap: wrap;
        }

        .newsletter-wrap .text h3 {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .newsletter-wrap .text p {
            opacity: 0.75;
        }

        .newsletter-wrap form {
            display: flex;
            gap: 10px;
            flex: 1;
            max-width: 440px;
            flex-wrap: wrap;
        }

        .newsletter-wrap form input {
            flex: 1;
            min-width: 180px;
            padding: 14px 20px;
            border-radius: 60px;
            border: 0;
            font-size: 0.95rem;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            outline: 2px solid transparent;
            transition: var(--transition);
        }

        .newsletter-wrap form input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .newsletter-wrap form input:focus {
            outline-color: var(--accent);
            background: rgba(255, 255, 255, 0.16);
        }

        .newsletter-wrap form .btn {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }

        .newsletter-wrap form .btn:hover {
            background: var(--accent-dark);
            border-color: var(--accent-dark);
        }

        #newsletterMsg {
            margin-top: 8px;
            font-size: 0.9rem;
            width: 100%;
        }

        /* ----- footer ----- */
        footer {
            margin-top: 12px;
            padding: 40px 0 24px;
            border-top: 1px solid var(--border-light);
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 36px;
            margin-bottom: 24px;
        }

        .footer-grid .brand-col .brand {
            font-size: 1.2rem;
            margin-bottom: 6px;
        }

        .footer-grid .brand-col p {
            color: var(--text-muted);
            font-size: 0.9rem;
            max-width: 280px;
        }

        .footer-grid .brand-col .socials {
            display: flex;
            gap: 8px;
            margin-top: 12px;
        }

        .footer-grid .brand-col .socials a {
            width: 38px;
            height: 38px;
            border-radius: 60px;
            background: var(--border-light);
            display: grid;
            place-items: center;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .footer-grid .brand-col .socials a:hover {
            background: var(--accent);
            color: #fff;
        }

        .footer-grid .col h5 {
            font-weight: 700;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .footer-grid .col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .footer-grid .col ul a {
            color: var(--text-muted);
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .footer-grid .col ul a:hover {
            color: var(--accent);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 16px;
            border-top: 1px solid var(--border-light);
            color: var(--text-muted);
            font-size: 0.85rem;
        }

        /* ----- responsive ----- */
        @media (max-width: 1000px) {
            .products-grid {
                grid-template-columns: repeat(3, 1fr);
            }
            .categories-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 820px) {
            .hero h1 {
                font-size: 2.2rem;
            }
            .deal-wrap {
                flex-direction: column;
            }
            .deal-wrap .deal-img {
                flex: 0 0 200px;
            }
            .deal-wrap .deal-content {
                padding: 28px;
            }
            .newsletter-wrap {
                flex-direction: column;
                text-align: center;
                padding: 32px 24px;
            }
            .newsletter-wrap form {
                max-width: 100%;
            }
            .footer-grid {
                grid-template-columns: 1fr 1fr;
            }
            .search-wrap {
                min-width: 140px;
            }
        }

        @media (max-width: 700px) {
            .nav-links {
                display: none;
            }
            .mobile-toggle {
                display: grid;
                place-items: center;
            }
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 14px;
            }
            .categories-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 12px;
            }
            .hero {
                margin: 12px 12px 0;
                padding: 32px 0;
            }
            .hero h1 {
                font-size: 1.8rem;
            }
            .section-header .title-group h2 {
                font-size: 1.3rem;
            }
            .timer-box {
                min-width: 48px;
                padding: 6px 10px;
            }
            .timer-box .num {
                font-size: 1.1rem;
            }
            .footer-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            .brand {
                font-size: 1.1rem;
            }
            .header-inner {
                flex-wrap: nowrap;
            }
            .search-wrap {
                min-width: 100px;
                padding: 0 8px 0 12px;
            }
            .search-wrap input {
                font-size: 0.8rem;
                padding: 8px 0;
            }
            .icon-btn {
                width: 36px;
                height: 36px;
                font-size: 1rem;
            }
            .cart-count {
                width: 18px;
                height: 18px;
                font-size: 0.6rem;
            }
        }

        @media (max-width: 450px) {
            .products-grid {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }
            .categories-grid {
                grid-template-columns: 1fr 1fr;
                gap: 8px;
            }
            .hero {
                margin: 8px 8px 0;
                padding: 20px 0;
            }
            .hero h1 {
                font-size: 1.5rem;
            }
            .container {
                padding: 0 12px;
            }
            .deal-wrap .deal-content {
                padding: 18px 16px;
            }
            .deal-wrap .deal-img {
                flex: 0 0 150px;
            }
            .newsletter-wrap {
                padding: 20px 16px;
            }
            .product-card .body {
                padding: 10px 10px 4px;
            }
            .product-card .body h5 {
                font-size: 0.85rem;
            }
            .product-card .body .price {
                font-size: 0.95rem;
            }
            .product-card .footer {
                padding: 4px 10px 12px;
            }
            .product-card .footer .add-btn {
                font-size: 0.75rem;
                padding: 8px;
            }
            .cat-card {
                padding: 14px 8px;
            }
            .cat-card .icon-wrap {
                width: 44px;
                height: 44px;
                font-size: 1.1rem;
            }
            .cat-card h4 {
                font-size: 0.8rem;
            }
            .timer-box {
                min-width: 40px;
                padding: 4px 6px;
            }
            .timer-box .num {
                font-size: 0.95rem;
            }
            .timer-box .label {
                font-size: 0.5rem;
            }
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <header>
        <div class="container header-inner">
            <div style="display:flex;align-items:center;gap:8px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="menu"><i class="fas fa-bars"></i></button>
                <a class="brand" href="#"><i class="fas fa-store-alt"></i><span>Nexus<span class="accent">Shop</span></span></a>
            </div>

            <nav>
                <ul class="nav-links">
                    <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </nav>

            <div style="display:flex;align-items:center;gap:10px;">
                <div class="search-wrap">
                    <input type="search" id="searchInput" placeholder="Search..." aria-label="Search" />
                    <button id="searchBtn"><i class="fas fa-search"></i></button>
                </div>
                <div class="header-actions">
                    <button class="icon-btn" aria-label="account"><i class="far fa-user"></i></button>
                    <button class="icon-btn" aria-label="wishlist"><i class="far fa-heart"></i></button>
                    <div class="cart-wrap">
                        <button class="icon-btn" id="cartBtn"><i class="fas fa-shopping-bag"></i></button>
                        <span class="cart-count" id="cartCount">0</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- mobile menu -->
        <div id="mobileMenu">
            <div class="container">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                    <li><a href="#"><i class="far fa-user"></i> Account</a></li>
                    <li><a href="#"><i class="far fa-heart"></i> Wishlist</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- MAIN -->
    <main>

        <!-- HERO -->
        <section class="hero">
            <div class="container">
                <div class="tag"><i class="fas fa-sparkles"></i> new collection 2026</div>
                <h1>Elevate your everyday</h1>
                <p>Curated essentials – fashion, tech, and accessories. Free shipping on first order.</p>
                <div class="actions">
                    <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Shop now</button>
                    <button class="btn btn-outline-light" id="exploreDeals"><i class="fas fa-clock"></i> Explore deals</button>
                </div>
            </div>
        </section>

        <!-- CATEGORIES -->
        <section class="section" id="categories">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2>Categories</h2>
                        <p>Shop by interest</p>
                    </div>
                    <a href="#" class="view-all">All <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="categories-grid" id="categoriesGrid"></div>
            </div>
        </section>

        <!-- PRODUCTS -->
        <section class="section" id="products">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2>Trending now</h2>
                        <p>Popular picks from our community</p>
                    </div>
                    <a href="#" class="view-all">View all <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="products-grid" id="productsGrid"></div>
            </div>
        </section>

        <!-- DEAL -->
        <section class="section" id="deals">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2>⚡ Flash deal</h2>
                        <p>Limited stock – grab it now</p>
                    </div>
                </div>
                <div class="deal-wrap">
                    <div class="deal-img">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air M2" loading="lazy">
                    </div>
                    <div class="deal-content">
                        <span class="tag"><i class="fas fa-bolt"></i> limited offer</span>
                        <h3>MacBook Air M2</h3>
                        <p class="desc">Thin, light, and incredibly powerful.</p>
                        <div>
                            <span class="price-big">$999 <span class="old">$1,199</span></span>
                        </div>
                        <p class="stock">Only <strong>12</strong> items left</p>
                        <div class="timer-grid" id="dealTimer">
                            <div class="timer-box"><div class="num" id="dealDays">0</div><div class="label">Days</div></div>
                            <div class="timer-box"><div class="num" id="dealHours">00</div><div class="label">Hrs</div></div>
                            <div class="timer-box"><div class="num" id="dealMinutes">00</div><div class="label">Min</div></div>
                            <div class="timer-box"><div class="num" id="dealSeconds">00</div><div class="label">Sec</div></div>
                        </div>
                        <button class="btn btn-primary" id="buyDeal"><i class="fas fa-cart-plus"></i> Add to cart</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS -->
        <section class="section" id="testimonials">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2>What customers say</h2>
                        <p>Real reviews from real people</p>
                    </div>
                </div>
                <div class="testimonials-scroll" id="testimonialsList"></div>
            </div>
        </section>

        <!-- NEWSLETTER -->
        <section class="section">
            <div class="container">
                <div class="newsletter-wrap">
                    <div class="text">
                        <h3>Stay in the loop</h3>
                        <p>Exclusive offers &amp; early access</p>
                    </div>
                    <form id="newsletterForm" onsubmit="return false;">
                        <input type="email" id="newsletterEmail" placeholder="Your email" aria-label="Email" required />
                        <button class="btn" id="subscribeBtn"><i class="fas fa-paper-plane"></i> Subscribe</button>
                        <div id="newsletterMsg"></div>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="brand-col">
                    <div class="brand"><i class="fas fa-store-alt"></i><span>Nexus<span class="accent">Shop</span></span></div>
                    <p>Modern e‑commerce demo – quality products, seamless experience.</p>
                    <div class="socials">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col"><h5>Company</h5><ul><li><a href="#">About</a></li><li><a href="#">Careers</a></li><li><a href="#">Press</a></li><li><a href="#">Blog</a></li></ul></div>
                <div class="col"><h5>Support</h5><ul><li><a href="#">Help Center</a></li><li><a href="#">Shipping</a></li><li><a href="#">Returns</a></li><li><a href="#">Contact</a></li></ul></div>
                <div class="col"><h5>Legal</h5><ul><li><a href="#">Privacy</a></li><li><a href="#">Terms</a></li><li><a href="#">Cookies</a></li></ul></div>
            </div>
            <div class="footer-bottom">&copy; <span id="year"></span> NexusShop. All rights reserved.</div>
        </div>
    </footer>

    <!-- SCRIPT -->
    <script>
        // ============================================================
        // DATA
        // ============================================================
        const CATEGORIES = [
            { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt', count: 24 },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: 18 },
            { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt', count: 42 },
            { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones', count: 31 },
            { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints', count: 27 },
            { id: 'accessories', name: 'Accessories', icon: 'fa-watch', count: 39 }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New',
                img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80',
                category: 'Smartphones' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, rating: 4, reviews: 86, badge: '',
                img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80',
                category: 'Laptops' },
            { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: 'Sale',
                img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 4, title: 'Nike Air Max 270', price: 150, rating: 4, reviews: 53, badge: '',
                img: 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80',
                category: 'Footwear' },
            { id: 5, title: 'Sony A7 IV Camera', price: 2499, rating: 5, reviews: 42, badge: 'New',
                img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80',
                category: 'Gadgets' },
            { id: 6, title: 'Chanel No. 5', price: 120, rating: 5, reviews: 189, badge: '',
                img: 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 7, title: 'Travel Backpack', price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: 'Sale',
                img: 'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 8, title: 'Sony WH-1000XM5', price: 399, rating: 5, reviews: 156, badge: '',
                img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80',
                category: 'Gadgets' }
        ];

        const TESTIMONIALS = [{
            name: 'Ava Martin',
            role: 'Verified buyer',
            avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80',
            text: 'Fast shipping, excellent support. Product exceeded expectations.',
            stars: 5
        }, {
            name: 'Michael Lee',
            role: 'Frequent shopper',
            avatar: 'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80',
            text: 'Great selection and seamless checkout. Will buy again.',
            stars: 4
        }, {
            name: 'Sophia Chen',
            role: 'Designer',
            avatar: 'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80',
            text: 'Beautiful quality and packaging. Everything arrived perfect.',
            stars: 5
        }, {
            name: 'James Wilson',
            role: 'Tech enthusiast',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80',
            text: 'Unbeatable prices on electronics. The M2 deal was amazing.',
            stars: 5
        }];

        // ============================================================
        // STATE
        // ============================================================
        let cartCount = 0;

        // ============================================================
        // DOM REFS
        // ============================================================
        const categoriesGrid = document.getElementById('categoriesGrid');
        const productsGrid = document.getElementById('productsGrid');
        const cartCountEl = document.getElementById('cartCount');
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const mobileToggle = document.getElementById('mobileToggle');
        const mobileMenu = document.getElementById('mobileMenu');
        const newsletterForm = document.getElementById('newsletterForm');
        const newsletterEmail = document.getElementById('newsletterEmail');
        const newsletterMsg = document.getElementById('newsletterMsg');
        const testimonialsList = document.getElementById('testimonialsList');

        // ============================================================
        // RENDER
        // ============================================================
        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(c => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `
                    <div class="icon-wrap"><i class="fas ${c.icon}"></i></div>
                    <h4>${c.name}</h4>
                    <div class="count">${c.count} items</div>
                `;
                el.addEventListener('click', () => {
                    searchInput.value = c.name;
                    filterProducts(c.name);
                    document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
                });
                categoriesGrid.appendChild(el);
            });
        }

        function renderProducts(list) {
            productsGrid.innerHTML = '';
            if (!list.length) {
                productsGrid.innerHTML =
                    `<p style="grid-column:1/-1;text-align:center;padding:32px;color:var(--text-muted);">No products found.</p>`;
                return;
            }
            list.forEach(p => {
                const el = document.createElement('article');
                el.className = 'product-card';
                const badgeClass = p.badge === 'Sale' ? 'sale' : '';
                const badgeHtml = p.badge ? `<span class="badge ${badgeClass}">${p.badge}</span>` : '';
                const oldPriceHtml = p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` :
                '';
                const stars = '★'.repeat(Math.round(p.rating)) + '☆'.repeat(5 - Math.round(p.rating));
                el.innerHTML = `
                    <div class="img-wrap">
                        <img src="${p.img}" alt="${p.title}" loading="lazy">
                        ${badgeHtml}
                        <button class="wish-btn" aria-label="wishlist"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="body">
                        <div class="category-tag">${p.category}</div>
                        <h5>${p.title}</h5>
                        <div class="price-row">
                            <span class="price">$${p.price.toLocaleString()}</span>
                            ${oldPriceHtml}
                        </div>
                        <div class="rating">${stars} <span>(${p.reviews})</span></div>
                    </div>
                    <div class="footer">
                        <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add</button>
                    </div>
                `;
                productsGrid.appendChild(el);
            });

            productsGrid.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    addToCart(Number(this.dataset.id), this);
                });
            });
        }

        function renderTestimonials() {
            testimonialsList.innerHTML = '';
            TESTIMONIALS.forEach(t => {
                const stars = '★'.repeat(t.stars) + '☆'.repeat(5 - t.stars);
                const el = document.createElement('div');
                el.className = 'testimonial-card';
                el.innerHTML = `
                    <div class="stars">${stars}</div>
                    <blockquote>“${t.text}”</blockquote>
                    <div class="author">
                        <img class="avatar" src="${t.avatar}" alt="${t.name}" loading="lazy">
                        <div><div class="name">${t.name}</div><div class="role">${t.role}</div></div>
                    </div>
                `;
                testimonialsList.appendChild(el);
            });
        }

        // ============================================================
        // HELPERS
        // ============================================================
        function updateCartCount() {
            cartCountEl.textContent = cartCount;
            cartCountEl.style.transform = 'scale(1.3)';
            setTimeout(() => cartCountEl.style.transform = 'scale(1)', 200);
        }

        function addToCart(id, btnEl) {
            const p = PRODUCTS.find(x => x.id === id);
            if (!p) return;
            cartCount++;
            updateCartCount();
            if (btnEl) {
                const orig = btnEl.innerHTML;
                btnEl.innerHTML = '<i class="fas fa-check"></i> Added';
                btnEl.classList.add('added');
                setTimeout(() => {
                    btnEl.innerHTML = orig;
                    btnEl.classList.remove('added');
                }, 1400);
            }
            const cartBtn = document.getElementById('cartBtn');
            cartBtn.style.color = 'var(--accent)';
            setTimeout(() => cartBtn.style.color = '', 400);
        }

        function filterProducts(query) {
            const q = String(query || '').trim().toLowerCase();
            if (!q) { renderProducts(PRODUCTS); return; }
            const filtered = PRODUCTS.filter(p =>
                p.title.toLowerCase().includes(q) ||
                p.category.toLowerCase().includes(q)
            );
            renderProducts(filtered);
        }

        // ============================================================
        // DEAL TIMER
        // ============================================================
        (function setupDealTimer() {
            const now = new Date();
            const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);

            function tick() {
                const diff = target - new Date();
                if (diff <= 0) {
                    document.getElementById('dealDays').textContent = '0';
                    document.getElementById('dealHours').textContent = '00';
                    document.getElementById('dealMinutes').textContent = '00';
                    document.getElementById('dealSeconds').textContent = '00';
                    return;
                }
                const days = Math.floor(diff / (24 * 3600 * 1000));
                const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
                const mins = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
                const secs = Math.floor((diff % (60 * 1000)) / 1000);
                document.getElementById('dealDays').textContent = days;
                document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
                document.getElementById('dealMinutes').textContent = String(mins).padStart(2, '0');
                document.getElementById('dealSeconds').textContent = String(secs).padStart(2, '0');
            }
            tick();
            setInterval(tick, 1000);
        })();

        // ============================================================
        // EVENTS
        // ============================================================
        searchBtn.addEventListener('click', () => filterProducts(searchInput.value));
        searchInput.addEventListener('keydown', (e) => { if (e.key === 'Enter') filterProducts(e.target.value); });

        mobileToggle.addEventListener('click', () => {
            const isOpen = mobileMenu.style.display === 'block';
            mobileMenu.style.display = isOpen ? 'none' : 'block';
            mobileToggle.innerHTML = isOpen ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
        });

        mobileMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            });
        });

        document.getElementById('shopNow').addEventListener('click', () => {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
        });
        document.getElementById('exploreDeals').addEventListener('click', () => {
            document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
        });

        document.getElementById('buyDeal').addEventListener('click', function() {
            cartCount++;
            updateCartCount();
            const orig = this.innerHTML;
            this.innerHTML = '<i class="fas fa-check"></i> Added!';
            this.style.background = '#2a9d8f';
            setTimeout(() => {
                this.innerHTML = orig;
                this.style.background = '';
            }, 1500);
        });

        document.getElementById('cartBtn').addEventListener('click', () => {
            alert(`🛒 Your cart has ${cartCount} item${cartCount !== 1 ? 's' : ''}.`);
        });

        newsletterForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const email = newsletterEmail.value.trim();
            if (!email || !email.includes('@')) {
                newsletterMsg.textContent = 'Please enter a valid email.';
                newsletterMsg.style.color = '#ffb3b3';
                newsletterMsg.style.display = 'block';
                return;
            }
            newsletterMsg.textContent = '🎉 Thanks for subscribing!';
            newsletterMsg.style.color = '#a8e6cf';
            newsletterMsg.style.display = 'block';
            newsletterEmail.value = '';
            setTimeout(() => newsletterMsg.style.display = 'none', 3400);
        });

        document.getElementById('year').textContent = new Date().getFullYear();

        // ============================================================
        // INIT
        // ============================================================
        renderCategories();
        renderProducts(PRODUCTS);
        renderTestimonials();
        updateCartCount();

        window.addEventListener('resize', () => {
            if (window.innerWidth > 768) {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });

        console.log('✨ NexusShop – user‑friendly experience loaded.');
    </script>

</body>
</html>
