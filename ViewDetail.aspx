<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="Electronics_shop.ViewDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
/* ===== Bright Green-Teal Neon Theme (ViewDetail) ===== */
/* Animated gradient background */
:root{
  --accent1: #00e497;
  --accent2: #00d2ff;
  --accent3: #00bfa6;
  --glass: rgba(255,255,255,0.7);
  --muted: #5b6b6b;
}

body {
  font-family: "Poppins", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  margin: 0;
  color: #052223;
  background: linear-gradient(120deg, #eafffb 0%, #f3fff9 35%, #effffb 100%);
  overflow-x: hidden;
}

/* animated radial sheen */
.bg-sheen {
  pointer-events: none;
  position: fixed;
  inset: 0;
  background: radial-gradient(600px 400px at 10% 20%, rgba(0,214,159,0.06), transparent 10%),
              radial-gradient(500px 350px at 90% 80%, rgba(0,210,255,0.04), transparent 12%);
  z-index: 0;
  animation: sheenMove 10s linear infinite alternate;
}
@keyframes sheenMove {
  from { transform: translate3d(-10px,-5px,0); }
  to   { transform: translate3d(10px,5px,0); }
}

/* gentle wave overlay */
.wave-overlay {
  pointer-events:none;
  position: fixed;
  inset: 0;
  background-image: radial-gradient(circle at 50% 0%, rgba(0,210,255,0.02), transparent 30%);
  z-index: 0;
}

/* page wrapper so content floats above background */
.product-details-container {
  position: relative;
  z-index: 2;
  display: flex;
  justify-content: center;
  padding: 48px 20px;
  margin: 20px auto;
  max-width: 1300px;
}

/* particle canvas sits behind content */
#particleCanvas {
  position: fixed;
  inset: 0;
  z-index: 1;
  pointer-events: none;
}

/* Glass card with neon border */
.details-card {
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: 36px;
  width: 100%;
  padding: 28px;
  border-radius: 18px;
  background: linear-gradient(180deg, rgba(255,255,255,0.85), rgba(245,255,250,0.85));
  box-shadow: 0 10px 40px rgba(3,45,37,0.08), 0 2px 8px rgba(0,0,0,0.04);
  border: 1px solid rgba(0,0,0,0.04);
  overflow: hidden;
  transition: transform 300ms cubic-bezier(.2,.8,.2,1), box-shadow 300ms;
}

/* neon rim */
.details-card::after{
  content: "";
  position: absolute;
  inset: -2px;
  border-radius: 20px;
  background: linear-gradient(90deg, rgba(0,228,151,0.14), rgba(0,210,255,0.12), rgba(0,191,166,0.10));
  z-index: 0;
  filter: blur(20px);
  opacity: .95;
  pointer-events:none;
}

/* subtle 3D lift on hover */
.details-card:hover { transform: translateY(-8px); box-shadow: 0 20px 60px rgba(3,45,37,0.12); }

/* left image area */
.image-section {
  position: relative;
  flex: 1 1 46%;
  min-width: 360px;
  z-index: 3;
  display:flex;
  flex-direction:column;
  align-items:center;
}

/* rounded image panel with light bezel */
.image-gallery {
  position: relative;
  width: 100%;
  height: 430px;
  border-radius: 14px;
  overflow: hidden;
  background: linear-gradient(180deg, #ffffff, #f6fffb);
  box-shadow: inset 0 2px 8px rgba(0,0,0,0.03);
  border: 1px solid rgba(3,45,37,0.03);
}

/* images positioned absolutely for fade transitions */
.image-gallery img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
  opacity: 0;
  transform: scale(1.03);
  transition: opacity 600ms ease, transform 600ms ease;
  z-index: 1;
}
.image-gallery img.active {
  opacity: 1;
  transform: scale(1);
  z-index: 2;
}

/* neon glow frame on active image */
.image-gallery .img-frame {
  position:absolute;
  inset: 8px;
  border-radius: 12px;
  pointer-events:none;
  box-shadow: 0 0 30px rgba(0,228,151,0.08), inset 0 0 20px rgba(0,210,255,0.03);
}

/* thumbnails row */
.thumbnails {
  display:flex;
  gap:12px;
  margin-top:16px;
  justify-content:center;
  flex-wrap:wrap;
}
.thumbnails img {
  width:78px;
  height:78px;
  border-radius:10px;
  object-fit:cover;
  cursor:pointer;
  border: 2px solid transparent;
  transition: transform 200ms ease, box-shadow 200ms ease, border-color 200ms;
  box-shadow: 0 4px 10px rgba(2,18,16,0.04);
}
.thumbnails img:hover { transform: translateY(-6px) scale(1.03); }
.thumbnails img.active-thumb {
  border-color: rgba(0,228,151,0.95);
  box-shadow: 0 8px 24px rgba(0,228,151,0.18);
  transform: translateY(-8px) scale(1.06);
}

/* right info area */
.info-section {
  flex: 1 1 48%;
  padding: 4px 8px;
  z-index: 3;
}

/* title and badges */
.info-section h2 {
  font-size: 2.1rem;
  color: #073633;
  margin: 0 0 6px 0;
  line-height:1.05;
}
.product-meta {
  display:flex;
  gap:12px;
  align-items:center;
  margin-bottom: 12px;
}
.badge {
  background: linear-gradient(90deg, rgba(0,228,151,0.12), rgba(0,210,255,0.08));
  color: #014034;
  padding:6px 10px;
  border-radius: 999px;
  font-weight:600;
  font-size: .9rem;
  box-shadow: 0 4px 16px rgba(0,228,151,0.06);
}

/* dynamic neon price */
.price {
  display:inline-block;
  font-size: 2.0rem;
  font-weight: 800;
  color: #007a5a;
  background: linear-gradient(90deg, rgba(0,228,151,0.06), rgba(0,210,255,0.03));
  padding:8px 12px;
  border-radius: 10px;
  box-shadow: 0 8px 30px rgba(0,228,151,0.08), inset 0 -6px 10px rgba(0,0,0,0.02);
  margin-top: 10px;
  text-shadow: 0 4px 18px rgba(0,228,151,0.12);
  animation: glowPrice 2.2s ease-in-out infinite;
}
@keyframes glowPrice {
  0% { box-shadow: 0 8px 30px rgba(0,228,151,0.06); transform: translateY(0); }
  50% { box-shadow: 0 16px 40px rgba(0,228,151,0.12); transform: translateY(-2px); }
  100% { box-shadow: 0 8px 30px rgba(0,228,151,0.06); transform: translateY(0); }
}

/* description panel */
.description-full {
  margin-top:18px;
  padding: 18px;
  border-radius: 12px;
  background: linear-gradient(180deg, #ffffff, #f6fffb);
  box-shadow: inset 0 2px 8px rgba(0,0,0,0.02);
  color: #234d45;
  line-height: 1.7;
}

/* CTA buttons */
.cart-buttons { margin-top: 22px; display:flex; gap:14px; flex-wrap:wrap; }
.cart-btn, .back-btn {
  padding: 12px 26px;
  border-radius: 999px;
  font-weight:700;
  cursor:pointer;
  border:none;
  display:inline-flex;
  align-items:center;
  gap:10px;
  transition: transform 180ms ease, box-shadow 180ms ease;
}
.cart-btn {
  background: linear-gradient(90deg, #00e497, #00d2ff);
  color: #032820;
  box-shadow: 0 8px 28px rgba(0,214,151,0.16);
}
.cart-btn:hover { transform: translateY(-6px) scale(1.02); box-shadow: 0 18px 48px rgba(0,214,151,0.2); }

.back-btn {
  background: linear-gradient(90deg, #ffffff, #eefaf6);
  color: #05564a;
  border: 1px solid rgba(5,86,74,0.06);
  box-shadow: 0 6px 20px rgba(2,18,16,0.04);
}
.back-btn:hover { transform: translateY(-4px); }

/* scroll reveal helper classes */
.reveal { opacity:0; transform: translateY(12px); transition: all 600ms ease; }
.reveal.visible { opacity:1; transform: translateY(0); }

/* responsive */
@media (max-width: 1000px) {
  .image-gallery { height: 380px; }
  .image-gallery img { height:380px; }
}
@media (max-width: 780px) {
  .details-card { padding:18px; gap:18px; }
  .image-section, .info-section { width: 100%; min-width: unset; }
  .image-gallery { height: 320px; }
  .image-gallery img { height:320px; }
  .thumbnails img { width:64px; height:64px; }
  .info-section h2 { font-size:1.6rem; }
  .price { font-size:1.5rem; }
}

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="collection-header">
<h1 style="color:navy; margin: 0 auto; width: fit-content;">Product Collection</h1>
        <asp:HyperLink ID="hlBackToCollection" runat="server" CssClass="btn back-btn" NavigateUrl="WebForm1.aspx">
            ← Back to Collection
        </asp:HyperLink>
    </div>

    <div class="product-details-container">
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" Width="100%">
            <ItemTemplate>
                <div class="details-card">
                    
                    <div class="image-section">
                        <div class="image-gallery">
                            <%-- Image controls similar to LaptopCollection.aspx--%>
                            <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active" onerror="this.style.display='none'" />
                            <asp:Image ID="img2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                            <asp:Image ID="img3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                            <asp:Image ID="img4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                        </div>
                        
                        <div class="thumbnails">
                             <%-- Thumbnail controls similar to LaptopCollection.aspx --%>
                            <asp:Image ID="thumb1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active-thumb" onclick="changeImage(this, '0')" onerror="this.style.display='none'" />
                            <asp:Image ID="thumb2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                            <asp:Image ID="thumb3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                            <asp:Image ID="thumb4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                        </div>
                    </div>

                    <div class="info-section">
                        <h2><%# Eval("Product_Name") %></h2>
                        <p class="price"><b>Price:</b> ₹<%# Eval("Price", "{0:N2}") %></p>
                        <p><b>Available Stock:</b> <%# Eval("Quantity") %></p>
                        
                        <div class="description-full">
                            <h3>Full Description</h3>
                            <p><%# Eval("Description") %></p>
                        </div>
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script>
    /* Bright green-teal enhancements:
   - thumbnail switching & auto slide
   - gentle image tilt following mouse pointer
   - particle canvas (lightweight)
   - reveal on scroll
   - graceful init
*/

    (function () {
        // helpers
        function qs(sel, ctx) { return (ctx || document).querySelector(sel); }
        function qsa(sel, ctx) { return Array.from((ctx || document).querySelectorAll(sel)); }

        // ----- Thumbnail switching & auto-slide -----
        function initGalleries() {
            qsa('.details-card').forEach(card => {
                const thumbs = qsa('.thumbnails img', card);
                const imgs = qsa('.image-gallery img', card);

                // set first active
                if (imgs[0]) imgs[0].classList.add('active');
                if (thumbs[0]) thumbs[0].classList.add('active-thumb');

                thumbs.forEach((t, idx) => {
                    t.addEventListener('click', () => {
                        imgs.forEach((im, i) => im.classList.toggle('active', i === idx));
                        thumbs.forEach((th, i) => th.classList.toggle('active-thumb', i === idx));
                    });
                });

                // auto-slide with safe guards
                if (imgs.length > 1) {
                    let ai = 0;
                    setInterval(() => {
                        imgs[ai].classList.remove('active');
                        thumbs[ai] && thumbs[ai].classList.remove('active-thumb');
                        ai = (ai + 1) % imgs.length;
                        imgs[ai].classList.add('active');
                        thumbs[ai] && thumbs[ai].classList.add('active-thumb');
                    }, 4500);
                }

                // image tilt effect
                const gallery = qs('.image-gallery', card);
                if (gallery) {
                    gallery.addEventListener('mousemove', e => {
                        const r = gallery.getBoundingClientRect();
                        const px = (e.clientX - r.left) / r.width - 0.5;
                        const py = (e.clientY - r.top) / r.height - 0.5;
                        const imgsActive = qsa('.image-gallery img.active', card);
                        imgsActive.forEach(img => {
                            img.style.transform = `translate3d(${px * 10}px, ${py * 8}px, 0) scale(1.03)`;
                        });
                    });
                    gallery.addEventListener('mouseleave', () => {
                        qsa('.image-gallery img', card).forEach(img => {
                            img.style.transform = '';
                        });
                    });
                }
            });
        }

        // ----- Particle canvas (lightweight) -----
        function initParticles() {
            const canvas = document.createElement('canvas');
            canvas.id = 'particleCanvas';
            document.body.appendChild(canvas);
            const ctx = canvas.getContext('2d');
            let w = canvas.width = innerWidth, h = canvas.height = innerHeight;
            window.addEventListener('resize', () => { w = canvas.width = innerWidth; h = canvas.height = innerHeight; });

            // small set of particles
            const particles = [];
            const count = Math.floor(Math.max(20, Math.min(80, (w * h) / 90000))); // scale with size
            for (let i = 0; i < count; i++) {
                particles.push({
                    x: Math.random() * w,
                    y: Math.random() * h,
                    r: 2 + Math.random() * 3,
                    vx: (Math.random() - 0.5) * 0.2,
                    vy: -0.2 - Math.random() * 0.4,
                    alpha: 0.05 + Math.random() * 0.12,
                    hue: 150 + Math.random() * 80
                });
            }

            function draw() {
                ctx.clearRect(0, 0, w, h);
                particles.forEach(p => {
                    p.x += p.vx; p.y += p.vy;
                    if (p.y < -10) { p.y = h + 10; p.x = Math.random() * w; }
                    if (p.x < -20) p.x = w + 20;
                    if (p.x > w + 20) p.x = -20;
                    ctx.beginPath();
                    const g = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.r * 6);
                    g.addColorStop(0, `hsla(${p.hue}, 90%, 60%, ${p.alpha})`);
                    g.addColorStop(1, `hsla(${p.hue}, 90%, 60%, 0)`);
                    ctx.fillStyle = g;
                    ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                    ctx.fill();
                });
                requestAnimationFrame(draw);
            }
            requestAnimationFrame(draw);
        }

        // ----- Scroll reveal -----
        function initReveal() {
            const obs = new IntersectionObserver((entries) => {
                entries.forEach(en => {
                    if (en.isIntersecting) en.target.classList.add('visible');
                });
            }, { threshold: 0.12 });

            qsa('.reveal, .details-card, .image-gallery, .description-full').forEach(el => {
                obs.observe(el);
            });
        }

        // ----- Ready -----
        document.addEventListener('DOMContentLoaded', () => {
            // insert decorative background layers
            const sheen = document.createElement('div'); sheen.className = 'bg-sheen'; document.body.appendChild(sheen);
            const wave = document.createElement('div'); wave.className = 'wave-overlay'; document.body.appendChild(wave);

            initParticles();
            initGalleries();
            initReveal();

            // small safety: re-init galleries if content is loaded dynamically later
            setTimeout(initGalleries, 800);
        });

    })();

</script>
</asp:Content>
