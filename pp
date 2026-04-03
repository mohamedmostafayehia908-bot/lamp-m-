<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>لهيب — متجر الشموع</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    --cream: #FAF6F0;
    --warm: #F5EBD8;
    --gold: #C8A96E;
    --gold-dark: #8B6914;
    --gold-light: #EDD9A3;
    --dark: #1C1208;
    --mid: #4A3520;
    --muted: #8B7355;
    --flame: #E8613A;
    --flame-light: #FDF0EA;
    --white: #FFFDF9;
    --shadow: rgba(28,18,8,0.12);
  }
  html { scroll-behavior: smooth; }
  body { font-family: 'Cairo', sans-serif; background: var(--cream); color: var(--dark); overflow-x: hidden; }

  /* ===== FLAME CURSOR ===== */
  body { cursor: none; }
  #cursor { position: fixed; width: 20px; height: 28px; pointer-events: none; z-index: 9999; transform: translate(-50%, -50%); transition: transform 0.1s; }
  #cursor svg { width: 100%; height: 100%; }

  /* ===== HERO ===== */
  #hero {
    min-height: 100vh;
    background: radial-gradient(ellipse at 60% 40%, #2A1A08 0%, #1C1208 60%, #0D0802 100%);
    display: flex; flex-direction: column; align-items: center; justify-content: center;
    position: relative; overflow: hidden; text-align: center;
  }
  .hero-particles { position: absolute; inset: 0; pointer-events: none; }
  .particle {
    position: absolute; width: 2px; height: 2px; background: var(--gold-light);
    border-radius: 50%; opacity: 0;
    animation: float-up var(--dur, 4s) var(--delay, 0s) infinite ease-in;
  }
  @keyframes float-up {
    0% { opacity: 0; transform: translateY(0) scale(1); }
    20% { opacity: 0.8; }
    80% { opacity: 0.4; }
    100% { opacity: 0; transform: translateY(-80px) scale(0.3); }
  }
  .hero-candle { font-size: 5rem; margin-bottom: 1rem; animation: flicker 2s infinite alternate; display: block; }
  @keyframes flicker {
    0% { filter: drop-shadow(0 0 20px #E8613A) drop-shadow(0 0 40px #C8A96E); transform: scale(1); }
    100% { filter: drop-shadow(0 0 30px #FF8C42) drop-shadow(0 0 60px #E8613A); transform: scale(1.05); }
  }
  .hero-title {
    font-family: 'Playfair Display', serif;
    font-size: clamp(3rem, 8vw, 5.5rem);
    color: var(--gold-light);
    letter-spacing: 4px;
    line-height: 1;
    margin-bottom: 0.5rem;
    animation: reveal 1s ease both;
  }
  .hero-sub {
    font-size: 1rem; color: var(--muted); letter-spacing: 2px; font-weight: 300;
    margin-bottom: 2.5rem; animation: reveal 1s 0.3s ease both;
  }
  @keyframes reveal { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
  .hero-tagline {
    font-size: clamp(1rem, 3vw, 1.3rem); color: var(--gold-light); opacity: 0.85;
    max-width: 500px; line-height: 1.8; margin-bottom: 3rem;
    animation: reveal 1s 0.5s ease both;
  }
  .hero-cta {
    display: flex; gap: 16px; flex-wrap: wrap; justify-content: center;
    animation: reveal 1s 0.7s ease both;
  }
  .btn-gold {
    padding: 14px 36px; border-radius: 40px;
    background: linear-gradient(135deg, var(--gold) 0%, #A07830 100%);
    color: var(--dark); font-family: 'Cairo', sans-serif; font-weight: 700;
    font-size: 1rem; border: none; cursor: none;
    letter-spacing: 1px; transition: all 0.3s;
    box-shadow: 0 4px 20px rgba(200,169,110,0.4);
  }
  .btn-gold:hover { transform: translateY(-2px); box-shadow: 0 8px 30px rgba(200,169,110,0.6); }
  .btn-outline {
    padding: 14px 36px; border-radius: 40px;
    background: transparent; color: var(--gold-light);
    font-family: 'Cairo', sans-serif; font-weight: 600;
    font-size: 1rem; border: 1px solid rgba(200,169,110,0.5); cursor: none;
    letter-spacing: 1px; transition: all 0.3s;
  }
  .btn-outline:hover { background: rgba(200,169,110,0.1); border-color: var(--gold); }
  .scroll-hint { position: absolute; bottom: 2rem; left: 50%; transform: translateX(-50%); color: var(--muted); font-size: 0.8rem; letter-spacing: 2px; animation: bounce 2s infinite; }
  @keyframes bounce { 0%,100% { transform: translateX(-50%) translateY(0); } 50% { transform: translateX(-50%) translateY(6px); } }

  /* ===== SECTION BASE ===== */
  .section { padding: 5rem 1.5rem; max-width: 1100px; margin: 0 auto; }
  .section-label { font-size: 0.75rem; letter-spacing: 4px; color: var(--gold); text-transform: uppercase; margin-bottom: 0.5rem; }
  .section-title { font-family: 'Playfair Display', serif; font-size: clamp(1.8rem, 4vw, 2.8rem); color: var(--dark); margin-bottom: 1rem; }
  .section-desc { color: var(--muted); font-size: 1rem; line-height: 1.8; max-width: 500px; }
  .divider { width: 60px; height: 2px; background: linear-gradient(90deg, var(--gold), transparent); margin: 1.5rem 0; }

  /* ===== CHOICE SECTION ===== */
  #choices { background: var(--white); }
  .choices-inner { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-top: 3rem; }
  @media(max-width:600px) { .choices-inner { grid-template-columns: 1fr; } }
  .choice-card {
    border: 1px solid rgba(200,169,110,0.2);
    border-radius: 24px; padding: 3rem 2rem;
    text-align: center; cursor: none;
    background: var(--cream);
    transition: all 0.4s cubic-bezier(0.175,0.885,0.32,1.275);
    position: relative; overflow: hidden;
  }
  .choice-card::before {
    content: ''; position: absolute; inset: 0;
    background: linear-gradient(135deg, rgba(200,169,110,0.05), transparent);
    opacity: 0; transition: opacity 0.3s;
  }
  .choice-card:hover { transform: translateY(-8px); border-color: var(--gold); box-shadow: 0 20px 60px rgba(200,169,110,0.2); }
  .choice-card:hover::before { opacity: 1; }
  .choice-icon { font-size: 4rem; display: block; margin-bottom: 1.2rem; }
  .choice-title { font-family: 'Playfair Display', serif; font-size: 1.5rem; color: var(--dark); margin-bottom: 0.5rem; }
  .choice-desc { color: var(--muted); font-size: 0.9rem; line-height: 1.7; }
  .choice-badge {
    display: inline-block; margin-top: 1.2rem; padding: 8px 24px;
    border: 1px solid var(--gold); border-radius: 20px; color: var(--gold-dark);
    font-size: 0.85rem; font-weight: 600; transition: all 0.3s;
  }
  .choice-card:hover .choice-badge { background: var(--gold); color: var(--dark); }

  /* ===== READY CANDLES ===== */
  #ready-candles { background: var(--cream); }
  .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); gap: 24px; margin-top: 3rem; }
  .product-card {
    background: var(--white); border-radius: 20px;
    border: 1px solid rgba(200,169,110,0.15);
    overflow: hidden; transition: all 0.3s; cursor: none;
  }
  .product-card:hover { transform: translateY(-6px); box-shadow: 0 16px 50px rgba(28,18,8,0.12); border-color: var(--gold); }
  .product-img { width: 100%; height: 200px; object-fit: cover; display: block; }
  .product-body { padding: 1.2rem; }
  .product-name { font-family: 'Playfair Display', serif; font-size: 1.05rem; color: var(--dark); margin-bottom: 0.3rem; }
  .product-desc { font-size: 0.8rem; color: var(--muted); line-height: 1.6; margin-bottom: 0.8rem; }
  .product-footer { display: flex; align-items: center; justify-content: space-between; }
  .product-price { font-size: 1.1rem; font-weight: 700; color: var(--gold-dark); }
  .add-btn {
    padding: 8px 18px; background: var(--gold); border: none; border-radius: 12px;
    color: var(--dark); font-family: 'Cairo', sans-serif; font-weight: 600;
    font-size: 0.85rem; cursor: none; transition: all 0.2s;
  }
  .add-btn:hover { background: var(--gold-dark); color: var(--white); transform: scale(1.05); }

  /* ===== CUSTOM BUILDER ===== */
  #custom-builder { background: var(--dark); color: var(--cream); }
  #custom-builder .section-title { color: var(--gold-light); }
  #custom-builder .section-label { color: var(--gold); }
  #custom-builder .divider { background: linear-gradient(90deg, var(--gold), transparent); }
  .builder-steps { display: flex; gap: 8px; margin: 2rem 0; flex-wrap: wrap; }
  .step-dot {
    width: 36px; height: 36px; border-radius: 50%;
    border: 1px solid rgba(200,169,110,0.3); display: flex; align-items: center;
    justify-content: center; font-size: 0.8rem; color: var(--muted); transition: all 0.3s;
  }
  .step-dot.active { background: var(--gold); color: var(--dark); border-color: var(--gold); font-weight: 700; }
  .step-dot.done { background: rgba(200,169,110,0.2); color: var(--gold); border-color: var(--gold); }
  .builder-step { display: none; animation: stepIn 0.4s ease; }
  .builder-step.active { display: block; }
  @keyframes stepIn { from { opacity: 0; transform: translateX(20px); } to { opacity: 1; transform: translateX(0); } }
  .step-title { font-family: 'Playfair Display', serif; font-size: 1.4rem; color: var(--gold-light); margin-bottom: 0.5rem; }
  .step-subtitle { color: var(--muted); font-size: 0.9rem; margin-bottom: 1.5rem; }
  .options-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(160px, 1fr)); gap: 16px; }
  .option-card {
    background: rgba(255,255,255,0.04); border: 1px solid rgba(200,169,110,0.15);
    border-radius: 16px; padding: 1rem; text-align: center; cursor: none;
    transition: all 0.3s;
  }
  .option-card:hover, .option-card.selected {
    border-color: var(--gold); background: rgba(200,169,110,0.1);
    transform: translateY(-4px);
  }
  .option-card.selected { box-shadow: 0 0 0 2px var(--gold); }
  .option-img { width: 100%; height: 110px; object-fit: cover; border-radius: 10px; margin-bottom: 0.7rem; }
  .option-name { font-size: 0.85rem; color: var(--gold-light); font-weight: 500; }
  .option-price { font-size: 0.75rem; color: var(--muted); margin-top: 2px; }
  .color-options-grid { display: flex; gap: 12px; flex-wrap: wrap; margin-bottom: 1.5rem; }
  .color-swatch {
    width: 48px; height: 48px; border-radius: 50%; cursor: none;
    border: 3px solid transparent; transition: all 0.3s; position: relative;
  }
  .color-swatch:hover, .color-swatch.selected { border-color: var(--gold); transform: scale(1.2); }
  .color-swatch::after { content: attr(data-name); position: absolute; bottom: -20px; left: 50%; transform: translateX(-50%); font-size: 0.65rem; color: var(--muted); white-space: nowrap; }
  .builder-nav { display: flex; gap: 12px; margin-top: 2rem; align-items: center; }
  .btn-prev { padding: 12px 28px; border-radius: 30px; background: transparent; border: 1px solid rgba(200,169,110,0.3); color: var(--muted); font-family: 'Cairo', sans-serif; font-size: 0.9rem; cursor: none; transition: all 0.2s; }
  .btn-prev:hover { border-color: var(--gold); color: var(--gold); }
  .btn-next { padding: 12px 28px; border-radius: 30px; background: var(--gold); border: none; color: var(--dark); font-family: 'Cairo', sans-serif; font-weight: 700; font-size: 0.9rem; cursor: none; transition: all 0.2s; }
  .btn-next:hover { background: var(--gold-dark); color: var(--white); }
  .price-summary {
    background: rgba(200,169,110,0.1); border: 1px solid rgba(200,169,110,0.2);
    border-radius: 16px; padding: 1.5rem; margin-top: 1.5rem;
  }
  .price-row { display: flex; justify-content: space-between; font-size: 0.9rem; color: var(--muted); margin-bottom: 0.5rem; }
  .price-row.total { font-size: 1.1rem; color: var(--gold-light); font-weight: 700; border-top: 1px solid rgba(200,169,110,0.2); padding-top: 0.8rem; margin-top: 0.8rem; }
  .custom-preview {
    background: rgba(255,255,255,0.03); border: 1px solid rgba(200,169,110,0.15);
    border-radius: 20px; padding: 2rem; margin-top: 2rem; text-align: center;
  }
  .custom-preview-img { width: 160px; height: 200px; object-fit: cover; border-radius: 12px; margin: 0 auto 1rem; display: block; }

  /* ===== CART ===== */
  #cart-btn {
    position: fixed; bottom: 2rem; left: 2rem;
    width: 64px; height: 64px; border-radius: 50%;
    background: linear-gradient(135deg, var(--gold), #A07830);
    border: none; cursor: none; z-index: 1000;
    display: flex; align-items: center; justify-content: center;
    box-shadow: 0 8px 30px rgba(200,169,110,0.5);
    transition: all 0.3s; font-size: 1.5rem;
  }
  #cart-btn:hover { transform: scale(1.1) translateY(-3px); box-shadow: 0 12px 40px rgba(200,169,110,0.7); }
  #cart-count {
    position: absolute; top: -4px; right: -4px;
    width: 22px; height: 22px; background: var(--flame);
    border-radius: 50%; font-size: 0.7rem; color: white; font-weight: 700;
    display: flex; align-items: center; justify-content: center;
    display: none;
  }
  .cart-panel {
    position: fixed; bottom: 0; left: 0; right: 0;
    background: var(--white); border-radius: 24px 24px 0 0;
    box-shadow: 0 -20px 60px rgba(28,18,8,0.2);
    padding: 2rem; z-index: 2000; max-height: 70vh; overflow-y: auto;
    transform: translateY(100%); transition: transform 0.4s cubic-bezier(0.175,0.885,0.32,1.275);
  }
  .cart-panel.open { transform: translateY(0); }
  .cart-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem; }
  .cart-title { font-family: 'Playfair Display', serif; font-size: 1.3rem; color: var(--dark); }
  .close-btn { background: none; border: none; font-size: 1.5rem; cursor: none; color: var(--muted); }
  .cart-item { display: flex; gap: 12px; align-items: center; padding: 12px 0; border-bottom: 1px solid rgba(200,169,110,0.15); }
  .cart-item-img { width: 60px; height: 60px; object-fit: cover; border-radius: 10px; flex-shrink: 0; }
  .cart-item-info { flex: 1; }
  .cart-item-name { font-weight: 600; font-size: 0.9rem; color: var(--dark); }
  .cart-item-price { font-size: 0.85rem; color: var(--gold-dark); margin-top: 2px; }
  .cart-item-remove { background: none; border: none; color: var(--muted); cursor: none; font-size: 1.1rem; }
  .cart-total-row { display: flex; justify-content: space-between; align-items: center; padding: 1rem 0; font-weight: 700; font-size: 1rem; color: var(--dark); }
  .checkout-btn {
    width: 100%; padding: 16px; background: linear-gradient(135deg, var(--gold), #A07830);
    border: none; border-radius: 16px; font-family: 'Cairo', sans-serif;
    font-size: 1rem; font-weight: 700; color: var(--dark); cursor: none;
    transition: all 0.3s; margin-top: 0.5rem;
  }
  .checkout-btn:hover { background: linear-gradient(135deg, #A07830, #7A5810); color: var(--white); }
  .cart-empty { text-align: center; color: var(--muted); padding: 2rem; font-size: 0.9rem; }

  /* ===== CHECKOUT ===== */
  #checkout { background: var(--warm); display: none; }
  #checkout.show { display: block; }
  .checkout-form { background: var(--white); border-radius: 24px; padding: 2.5rem; max-width: 600px; margin: 2rem auto 0; box-shadow: 0 10px 40px rgba(28,18,8,0.08); }
  .form-group { margin-bottom: 1.5rem; }
  .form-label { display: block; font-size: 0.85rem; color: var(--muted); margin-bottom: 8px; font-weight: 500; letter-spacing: 1px; }
  .form-input {
    width: 100%; padding: 14px 18px; border: 1px solid rgba(200,169,110,0.3);
    border-radius: 12px; font-family: 'Cairo', sans-serif; font-size: 0.95rem;
    color: var(--dark); background: var(--cream);
    outline: none; transition: border-color 0.3s; direction: rtl;
  }
  .form-input:focus { border-color: var(--gold); }
  .payment-options { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
  .payment-opt {
    border: 1px solid rgba(200,169,110,0.3); border-radius: 12px;
    padding: 14px; text-align: center; cursor: none; transition: all 0.3s;
    font-size: 0.9rem; color: var(--muted);
  }
  .payment-opt.selected { border-color: var(--gold); background: rgba(200,169,110,0.1); color: var(--gold-dark); font-weight: 600; }
  .order-summary-box { background: var(--cream); border-radius: 12px; padding: 1.2rem; margin-bottom: 1.5rem; }
  .submit-order-btn {
    width: 100%; padding: 18px; background: linear-gradient(135deg, var(--gold), #8B6914);
    border: none; border-radius: 16px; font-family: 'Cairo', sans-serif;
    font-size: 1.1rem; font-weight: 700; color: var(--dark); cursor: none;
    transition: all 0.3s; letter-spacing: 1px;
  }
  .submit-order-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 30px rgba(200,169,110,0.4); }
  .success-msg { display: none; text-align: center; padding: 3rem; }
  .success-msg.show { display: block; }
  .success-icon { font-size: 4rem; margin-bottom: 1rem; }
  .success-title { font-family: 'Playfair Display', serif; font-size: 1.8rem; color: var(--gold-dark); margin-bottom: 0.5rem; }
  .success-sub { color: var(--muted); }

  /* ===== FOOTER ===== */
  footer { background: var(--dark); color: var(--muted); text-align: center; padding: 2rem; font-size: 0.85rem; }
  footer span { color: var(--gold); font-family: 'Playfair Display', serif; }

  /* ===== ANIMATIONS ===== */
  .fade-in { opacity: 0; transform: translateY(30px); transition: opacity 0.6s ease, transform 0.6s ease; }
  .fade-in.visible { opacity: 1; transform: translateY(0); }

  /* overlay */
  .overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 1999; display: none; }
  .overlay.show { display: block; }

  /* scrollbar */
  ::-webkit-scrollbar { width: 6px; }
  ::-webkit-scrollbar-track { background: var(--cream); }
  ::-webkit-scrollbar-thumb { background: var(--gold); border-radius: 3px; }
</style>
</head>
<body>

<!-- Flame cursor -->
<div id="cursor">
  <svg viewBox="0 0 20 28" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M10 2C10 2 4 8 4 14C4 17.3 6.7 20 10 20C13.3 20 16 17.3 16 14C16 8 10 2 10 2Z" fill="#E8613A" opacity="0.9"/>
    <path d="M10 8C10 8 7 11.5 7 14C7 15.7 8.3 17 10 17C11.7 17 13 15.7 13 14C13 11.5 10 8 10 8Z" fill="#FFD700"/>
    <ellipse cx="10" cy="24" rx="3" ry="1.5" fill="#8B6914" opacity="0.3"/>
  </svg>
</div>

<!-- Hero -->
<section id="hero">
  <div class="hero-particles" id="particles"></div>
  <span class="hero-candle">🕯️</span>
  <h1 class="hero-title">لـهيـب</h1>
  <p class="hero-sub">LAHIB • CANDLES</p>
  <p class="hero-tagline">
    حيث تحكي كل شمعة قصة دفء وجمال<br>
    اختر من مجموعتنا أو صنع شمعتك الخاصة
  </p>
  <div class="hero-cta">
    <button class="btn-gold" onclick="scrollTo('#choices')">اكتشف الآن</button>
    <button class="btn-outline" onclick="scrollTo('#custom-builder')">صنع شمعتك</button>
  </div>
  <div class="scroll-hint">▼ &nbsp; تمرر للأسفل</div>
</section>

<!-- Choices -->
<section id="choices">
  <div class="section">
    <p class="section-label fade-in">اختر تجربتك</p>
    <h2 class="section-title fade-in">ابدأ من هنا</h2>
    <div class="divider fade-in"></div>
    <div class="choices-inner">
      <div class="choice-card fade-in" onclick="scrollTo('#ready-candles')">
        <span class="choice-icon">🕯️</span>
        <h3 class="choice-title">شمع جاهز</h3>
        <p class="choice-desc">مجموعة مختارة بعناية من أجمل شموعنا. روائح فاخرة وتصاميم مميزة جاهزة للشحن.</p>
        <span class="choice-badge">اختر الآن ←</span>
      </div>
      <div class="choice-card fade-in" onclick="scrollTo('#custom-builder')">
        <span class="choice-icon">✨</span>
        <h3 class="choice-title">اصنع شمعتك بنفسك</h3>
        <p class="choice-desc">حدد نوع الكاب، اللون، العطر والشكل. نصنعها لك بأيدينا بالمواصفات التي تحب.</p>
        <span class="choice-badge">ابدأ التصميم ←</span>
      </div>
    </div>
  </div>
</section>

<!-- Ready Candles -->
<section id="ready-candles">
  <div class="section">
    <p class="section-label fade-in">مجموعتنا</p>
    <h2 class="section-title fade-in">الشموع الجاهزة</h2>
    <div class="divider fade-in"></div>
    <p class="section-desc fade-in">كل شمعة مصنوعة يدوياً من شمع الصويا الطبيعي بروائح مستوحاة من أجمل لحظات الحياة.</p>
    <div class="products-grid" id="products-grid"></div>
  </div>
</section>

<!-- Custom Builder -->
<section id="custom-builder">
  <div class="section">
    <p class="section-label">صنع بنفسك</p>
    <h2 class="section-title">صمم شمعتك</h2>
    <div class="divider"></div>
    <p style="color:var(--muted);font-size:0.9rem;margin-bottom:2rem;">اختر كل التفاصيل خطوة بخطوة وسنصنعها لك</p>
    <div class="builder-steps" id="builder-steps"></div>
    <!-- Step 1: Cup type -->
    <div class="builder-step active" id="step-0">
      <h3 class="step-title">نوع الكاب 🏺</h3>
      <p class="step-subtitle">اختر الوعاء الذي ستُصنع فيه شمعتك</p>
      <div class="options-grid" id="cup-options"></div>
    </div>
    <!-- Step 2: Color -->
    <div class="builder-step" id="step-1">
      <h3 class="step-title">لون الشمعة 🎨</h3>
      <p class="step-subtitle">اختر اللون المفضل لك</p>
      <div class="color-options-grid" id="color-options"></div>
      <div style="margin-top:2.5rem;" class="options-grid" id="color-visual-grid"></div>
    </div>
    <!-- Step 3: Shape/Decoration -->
    <div class="builder-step" id="step-2">
      <h3 class="step-title">الشكل والزينة ⭐</h3>
      <p class="step-subtitle">أضف لمسة خاصة لشمعتك</p>
      <div class="options-grid" id="shape-options"></div>
    </div>
    <!-- Step 4: Summary -->
    <div class="builder-step" id="step-3">
      <h3 class="step-title">شمعتك جاهزة ✨</h3>
      <p class="step-subtitle">مراجعة الطلب قبل الإضافة للسلة</p>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;align-items:start;" id="summary-container"></div>
    </div>
    <div class="builder-nav">
      <button class="btn-prev" id="prev-btn" onclick="prevStep()" style="display:none">→ السابق</button>
      <button class="btn-next" id="next-btn" onclick="nextStep()">التالي ←</button>
    </div>
  </div>
</section>

<!-- Checkout -->
<section id="checkout">
  <div class="section">
    <p class="section-label fade-in">أتمام الطلب</p>
    <h2 class="section-title fade-in">بياناتك</h2>
    <div class="divider fade-in"></div>
    <div class="checkout-form" id="checkout-form">
      <div class="order-summary-box">
        <h4 style="color:var(--gold-dark);margin-bottom:0.8rem;font-size:0.95rem;">ملخص الطلب</h4>
        <div id="checkout-summary"></div>
        <div class="price-row total" style="border-top:1px solid rgba(200,169,110,0.2);padding-top:0.8rem;margin-top:0.5rem;">
          <span>الإجمالي</span>
          <span id="checkout-total">0 جنيه</span>
        </div>
      </div>
      <div class="form-group">
        <label class="form-label">الاسم الكامل</label>
        <input class="form-input" type="text" id="f-name" placeholder="اكتب اسمك هنا...">
      </div>
      <div class="form-group">
        <label class="form-label">رقم الهاتف</label>
        <input class="form-input" type="tel" id="f-phone" placeholder="01xxxxxxxxx">
      </div>
      <div class="form-group">
        <label class="form-label">عنوان المنزل</label>
        <input class="form-input" type="text" id="f-address" placeholder="المحافظة / المنطقة / الشارع / رقم المنزل">
      </div>
      <div class="form-group">
        <label class="form-label">طريقة الدفع</label>
        <div class="payment-options">
          <div class="payment-opt selected" onclick="selectPayment(this,'cash')">💵 كاش عند الاستلام</div>
          <div class="payment-opt" onclick="selectPayment(this,'instapay')">📱 إنستاباي</div>
        </div>
      </div>
      <button class="submit-order-btn" onclick="submitOrder()">🕯️ تأكيد الطلب</button>
    </div>
    <div class="success-msg" id="success-msg">
      <div class="success-icon">🎉</div>
      <h3 class="success-title">تم استلام طلبك!</h3>
      <p class="success-sub">سنتواصل معك خلال 24 ساعة لتأكيد الطلب والتوصيل. شكراً لثقتك في لهيب 🕯️</p>
    </div>
  </div>
</section>

<footer>
  <p>صُنع بـ ❤️ في مصر &nbsp;•&nbsp; <span>لـهيـب</span> للشموع &nbsp;•&nbsp; 2025</p>
</footer>

<!-- Cart Button -->
<button id="cart-btn" onclick="toggleCart()">
  🛒
  <span id="cart-count">0</span>
</button>

<!-- Overlay -->
<div class="overlay" id="overlay" onclick="toggleCart()"></div>

<!-- Cart Panel -->
<div class="cart-panel" id="cart-panel">
  <div class="cart-header">
    <h3 class="cart-title">🛒 سلة التسوق</h3>
    <button class="close-btn" onclick="toggleCart()">✕</button>
  </div>
  <div id="cart-items-list"></div>
  <div id="cart-bottom" style="display:none">
    <div class="cart-total-row">
      <span>الإجمالي</span>
      <span id="cart-total-display">0 جنيه</span>
    </div>
    <button class="checkout-btn" onclick="goCheckout()">المضي للدفع ←</button>
  </div>
</div>

<script>
// Cursor
const cursor = document.getElementById('cursor');
document.addEventListener('mousemove', e => {
  cursor.style.left = e.clientX + 'px';
  cursor.style.top = e.clientY + 'px';
});

// Particles
const pContainer = document.getElementById('particles');
for(let i=0;i<30;i++){
  const p = document.createElement('div');
  p.className = 'particle';
  p.style.cssText = `left:${Math.random()*100}%;bottom:${Math.random()*40}%;--dur:${3+Math.random()*4}s;--delay:${Math.random()*5}s;width:${1+Math.random()*3}px;height:${1+Math.random()*3}px;`;
  pContainer.appendChild(p);
}

// Scroll helper
function scrollTo(id) {
  document.querySelector(id).scrollIntoView({behavior:'smooth'});
}

// Fade in on scroll
const observer = new IntersectionObserver(entries => {
  entries.forEach(e => { if(e.isIntersecting) e.target.classList.add('visible'); });
}, {threshold:0.1});
document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));

// ============ DATA ============
const products = [
  {
    id:'p1', name:'شمعة العنبر الملكي',
    desc:'رائحة عنبر دافئة مع لمسة خشب الصندل الفاخر',
    price:120, img:'https://images.unsplash.com/photo-1608181831718-c9e5cd4c6f4c?w=400&q=80'
  },
  {
    id:'p2', name:'شمعة الورد الأبيض',
    desc:'نقاء وأناقة مستوحاة من حدائق الورود الفرنسية',
    price:95, img:'https://images.unsplash.com/photo-1603905731-1f7e3e4de6b7?w=400&q=80'
  },
  {
    id:'p3', name:'شمعة العود الشرقي',
    desc:'رائحة شرقية أصيلة تملأ المكان بالدفء والهدوء',
    price:150, img:'https://images.unsplash.com/photo-1602523961358-f9f03dd8b2f4?w=400&q=80'
  },
  {
    id:'p4', name:'شمعة لافندر الليل',
    desc:'مهدئة ومريحة مثالية لجلسات الاسترخاء والتأمل',
    price:85, img:'https://images.unsplash.com/photo-1589391886645-d51941baf7fb?w=400&q=80'
  },
  {
    id:'p5', name:'شمعة الفانيليا الدافئة',
    desc:'حلاوة الفانيليا الحقيقية مع نفحة القرفة المبهجة',
    price:80, img:'https://images.unsplash.com/photo-1571942676516-bcab84649e44?w=400&q=80'
  },
  {
    id:'p6', name:'شمعة الياسمين الفاخرة',
    desc:'رائحة ياسمين طبيعية تحمل عبق الليالي الجميلة',
    price:110, img:'https://images.unsplash.com/photo-1616046229478-9e38e6ce8c84?w=400&q=80'
  }
];

const cupTypes = [
  { id:'c1', name:'زجاج شفاف', price:40, img:'https://images.unsplash.com/photo-1602523961358-f9f03dd8b2f4?w=300&q=80' },
  { id:'c2', name:'زجاج كهرماني', price:55, img:'https://images.unsplash.com/photo-1608181831718-c9e5cd4c6f4c?w=300&q=80' },
  { id:'c3', name:'سيراميك أبيض', price:65, img:'https://images.unsplash.com/photo-1616046229478-9e38e6ce8c84?w=300&q=80' },
  { id:'c4', name:'علبة قصدير', price:35, img:'https://images.unsplash.com/photo-1589391886645-d51941baf7fb?w=300&q=80' },
];

const colors = [
  { id:'col1', name:'أبيض', hex:'#F5F5F0', price:0, img:'https://images.unsplash.com/photo-1603905731-1f7e3e4de6b7?w=300&q=80' },
  { id:'col2', name:'وردي', hex:'#F4A0B5', price:10, img:'https://images.unsplash.com/photo-1571942676516-bcab84649e44?w=300&q=80' },
  { id:'col3', name:'بيج ذهبي', hex:'#D4A96A', price:10, img:'https://images.unsplash.com/photo-1603905731-1f7e3e4de6b7?w=300&q=80' },
  { id:'col4', name:'أخضر', hex:'#7EC8A0', price:10, img:'https://images.unsplash.com/photo-1616046229478-9e38e6ce8c84?w=300&q=80' },
  { id:'col5', name:'أسود فاخر', hex:'#2C2C2C', price:15, img:'https://images.unsplash.com/photo-1589391886645-d51941baf7fb?w=300&q=80' },
  { id:'col6', name:'أزرق سماوي', hex:'#87CEEB', price:10, img:'https://images.unsplash.com/photo-1608181831718-c9e5cd4c6f4c?w=300&q=80' },
];

const shapes = [
  { id:'s1', name:'قمر هلال', price:25, img:'https://images.unsplash.com/photo-1589391886645-d51941baf7fb?w=300&q=80' },
  { id:'s2', name:'نجمة ذهبية', price:20, img:'https://images.unsplash.com/photo-1571942676516-bcab84649e44?w=300&q=80' },
  { id:'s3', name:'ورود مجففة', price:30, img:'https://images.unsplash.com/photo-1603905731-1f7e3e4de6b7?w=300&q=80' },
  { id:'s4', name:'بدون زينة', price:0, img:'https://images.unsplash.com/photo-1602523961358-f9f03dd8b2f4?w=300&q=80' },
];

// ============ PRODUCTS ============
const grid = document.getElementById('products-grid');
products.forEach(p => {
  grid.innerHTML += `
  <div class="product-card fade-in">
    <img class="product-img" src="${p.img}" alt="${p.name}" loading="lazy">
    <div class="product-body">
      <h3 class="product-name">${p.name}</h3>
      <p class="product-desc">${p.desc}</p>
      <div class="product-footer">
        <span class="product-price">${p.price} جنيه</span>
        <button class="add-btn" onclick="addToCart('${p.id}','${p.name}',${p.price},'${p.img}')">+ أضف للسلة</button>
      </div>
    </div>
  </div>`;
});
document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));

// ============ BUILDER ============
let currentStep = 0;
const totalSteps = 4;
const selections = { cup: null, color: null, shape: null };
const stepLabels = ['الكاب','اللون','الزينة','المراجعة'];

function renderBuilderSteps(){
  const stepsEl = document.getElementById('builder-steps');
  stepsEl.innerHTML = '';
  for(let i=0;i<totalSteps;i++){
    const d = document.createElement('div');
    d.className = 'step-dot' + (i<currentStep?' done':i===currentStep?' active':'');
    d.textContent = i<currentStep ? '✓' : (i+1);
    const lbl = document.createElement('span');
    lbl.style.cssText = 'font-size:0.7rem;color:var(--muted);margin-right:4px;';
    lbl.textContent = stepLabels[i];
    stepsEl.appendChild(d);
    stepsEl.appendChild(lbl);
  }
}

function renderCupOptions(){
  const el = document.getElementById('cup-options');
  el.innerHTML = '';
  cupTypes.forEach(c => {
    const div = document.createElement('div');
    div.className = 'option-card' + (selections.cup?.id===c.id?' selected':'');
    div.onclick = () => { selections.cup = c; renderCupOptions(); };
    div.innerHTML = `<img class="option-img" src="${c.img}" alt="${c.name}"><div class="option-name">${c.name}</div><div class="option-price">+${c.price} جنيه</div>`;
    el.appendChild(div);
  });
}

function renderColorOptions(){
  const swatchEl = document.getElementById('color-options');
  const gridEl = document.getElementById('color-visual-grid');
  swatchEl.innerHTML = '';
  gridEl.innerHTML = '';
  colors.forEach(c => {
    const sw = document.createElement('div');
    sw.className = 'color-swatch' + (selections.color?.id===c.id?' selected':'');
    sw.style.background = c.hex;
    sw.setAttribute('data-name', c.name);
    sw.onclick = () => { selections.color = c; renderColorOptions(); };
    swatchEl.appendChild(sw);

    const card = document.createElement('div');
    card.className = 'option-card' + (selections.color?.id===c.id?' selected':'');
    card.onclick = () => { selections.color = c; renderColorOptions(); };
    card.innerHTML = `<img class="option-img" src="${c.img}" alt="${c.name}"><div class="option-name">${c.name}</div><div class="option-price">${c.price?'+'+c.price+' جنيه':'مجاناً'}</div>`;
    gridEl.appendChild(card);
  });
}

function renderShapeOptions(){
  const el = document.getElementById('shape-options');
  el.innerHTML = '';
  shapes.forEach(s => {
    const div = document.createElement('div');
    div.className = 'option-card' + (selections.shape?.id===s.id?' selected':'');
    div.onclick = () => { selections.shape = s; renderShapeOptions(); };
    div.innerHTML = `<img class="option-img" src="${s.img}" alt="${s.name}"><div class="option-name">${s.name}</div><div class="option-price">${s.price?'+'+s.price+' جنيه':'مجاناً'}</div>`;
    el.appendChild(div);
  });
}

function calcCustomPrice(){
  return (selections.cup?.price||0) + (selections.color?.price||0) + (selections.shape?.price||0);
}

function renderSummary(){
  const el = document.getElementById('summary-container');
  const total = calcCustomPrice();
  el.innerHTML = `
  <div>
    <div class="price-summary">
      <div class="price-row"><span>نوع الكاب</span><span>${selections.cup?.name||'—'}</span></div>
      <div class="price-row"><span>سعر الكاب</span><span>${selections.cup?.price||0} جنيه</span></div>
      <div class="price-row"><span>اللون</span><span>${selections.color?.name||'—'}</span></div>
      <div class="price-row"><span>إضافة اللون</span><span>${selections.color?.price||0} جنيه</span></div>
      <div class="price-row"><span>الزينة</span><span>${selections.shape?.name||'—'}</span></div>
      <div class="price-row"><span>إضافة الزينة</span><span>${selections.shape?.price||0} جنيه</span></div>
      <div class="price-row total"><span>الإجمالي</span><span>${total} جنيه</span></div>
    </div>
    <button class="btn-next" style="width:100%;margin-top:1rem;" onclick="addCustomToCart()">✨ أضف للسلة</button>
  </div>
  <div class="custom-preview">
    <img class="custom-preview-img" src="${selections.cup?.img||''}" alt="معاينة">
    <p style="color:var(--gold-light);font-size:0.85rem;margin-top:0.5rem;">شمعة مخصصة</p>
    <div style="width:24px;height:24px;border-radius:50%;background:${selections.color?.hex||'#ccc'};margin:8px auto;border:2px solid rgba(200,169,110,0.4);"></div>
    <p style="color:var(--muted);font-size:0.8rem;">${selections.shape?.name||''}</p>
  </div>`;
}

function nextStep(){
  if(currentStep===0 && !selections.cup){ alert('من فضلك اختر نوع الكاب'); return; }
  if(currentStep===1 && !selections.color){ alert('من فضلك اختر اللون'); return; }
  if(currentStep===2 && !selections.shape){ alert('من فضلك اختر الزينة'); return; }
  if(currentStep < totalSteps-1){
    document.getElementById(`step-${currentStep}`).classList.remove('active');
    currentStep++;
    document.getElementById(`step-${currentStep}`).classList.add('active');
    if(currentStep===3) renderSummary();
    document.getElementById('prev-btn').style.display = currentStep>0?'inline-block':'none';
    if(currentStep===3) document.getElementById('next-btn').style.display='none';
    renderBuilderSteps();
  }
}

function prevStep(){
  if(currentStep>0){
    document.getElementById(`step-${currentStep}`).classList.remove('active');
    currentStep--;
    document.getElementById(`step-${currentStep}`).classList.add('active');
    document.getElementById('prev-btn').style.display = currentStep>0?'inline-block':'none';
    document.getElementById('next-btn').style.display = 'inline-block';
    renderBuilderSteps();
  }
}

function addCustomToCart(){
  const total = calcCustomPrice();
  const name = `شمعة مخصصة • ${selections.cup?.name} • ${selections.color?.name}`;
  addToCart('custom_'+Date.now(), name, total, selections.cup?.img||'');
  // reset
  currentStep=0; selections.cup=null; selections.color=null; selections.shape=null;
  document.querySelectorAll('.builder-step').forEach((el,i)=>{el.classList.toggle('active',i===0);});
  document.getElementById('prev-btn').style.display='none';
  document.getElementById('next-btn').style.display='inline-block';
  renderBuilderSteps(); renderCupOptions();
}

// Init builder
renderBuilderSteps();
renderCupOptions();
renderColorOptions();
renderShapeOptions();

// ============ CART ============
let cart = [];

function addToCart(id, name, price, img){
  const existing = cart.find(i=>i.id===id);
  if(existing){ existing.qty = (existing.qty||1)+1; }
  else { cart.push({id,name,price,img,qty:1}); }
  updateCartUI();
  toggleCart();
}

function removeFromCart(id){
  cart = cart.filter(i=>i.id!==id);
  updateCartUI();
}

function updateCartUI(){
  const count = cart.reduce((a,i)=>a+(i.qty||1),0);
  const total = cart.reduce((a,i)=>a+(i.price*(i.qty||1)),0);
  const countEl = document.getElementById('cart-count');
  countEl.textContent = count;
  countEl.style.display = count>0?'flex':'none';
  document.getElementById('cart-total-display').textContent = total+' جنيه';
  document.getElementById('cart-bottom').style.display = cart.length>0?'block':'none';
  const list = document.getElementById('cart-items-list');
  if(cart.length===0){
    list.innerHTML = '<div class="cart-empty">🛒 سلتك فارغة<br><span style="font-size:0.8rem;">أضف شموع رائعة!</span></div>';
    return;
  }
  list.innerHTML = cart.map(i=>`
  <div class="cart-item">
    <img class="cart-item-img" src="${i.img}" alt="${i.name}" onerror="this.src='https://images.unsplash.com/photo-1602523961358-f9f03dd8b2f4?w=60&q=80'">
    <div class="cart-item-info">
      <div class="cart-item-name">${i.name}</div>
      <div class="cart-item-price">${i.price * (i.qty||1)} جنيه ${i.qty>1?'(×'+i.qty+')':''}</div>
    </div>
    <button class="cart-item-remove" onclick="removeFromCart('${i.id}')">✕</button>
  </div>`).join('');
}

function toggleCart(){
  const panel = document.getElementById('cart-panel');
  const overlay = document.getElementById('overlay');
  panel.classList.toggle('open');
  overlay.classList.toggle('show');
}

function goCheckout(){
  toggleCart();
  const section = document.getElementById('checkout');
  section.classList.add('show');
  section.scrollIntoView({behavior:'smooth'});
  const total = cart.reduce((a,i)=>a+(i.price*(i.qty||1)),0);
  document.getElementById('checkout-total').textContent = total+' جنيه';
  document.getElementById('checkout-summary').innerHTML = cart.map(i=>`
  <div style="display:flex;justify-content:space-between;font-size:0.85rem;color:#8B7355;margin-bottom:4px;">
    <span>${i.name}</span><span>${i.price*(i.qty||1)} جنيه</span>
  </div>`).join('');
}

function selectPayment(el, method){
  document.querySelectorAll('.payment-opt').forEach(o=>o.classList.remove('selected'));
  el.classList.add('selected');
}

function submitOrder(){
  const name = document.getElementById('f-name').value.trim();
  const phone = document.getElementById('f-phone').value.trim();
  const address = document.getElementById('f-address').value.trim();
  if(!name||!phone||!address){ alert('من فضلك أكمل جميع البيانات'); return; }
  document.getElementById('checkout-form').style.display='none';
  document.getElementById('success-msg').classList.add('show');
  cart = []; updateCartUI();
}

updateCartUI();
</script>
</body>
</html>
