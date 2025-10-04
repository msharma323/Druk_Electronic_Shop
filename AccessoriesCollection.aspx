<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AccessoriesCollection.aspx.cs" Inherits="Electronics_shop.AccessoriesCollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/LaptopCollection.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="collection-header">
            <h2 style="color:navy;">Laptop Collection</h2>
            <asp:HyperLink ID="hlViewCart" runat="server" CssClass="btn view-cart-btn" NavigateUrl="Cart.aspx">
                Go to Cart (<asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>)
            </asp:HyperLink>
        </div>

        <div class="product-grid">
            <asp:Repeater ID="rptAccessories" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <div class="image-gallery">
                            <%# RenderImageGallery(Eval("ImageUrls"), Eval("Name")) %>
                        </div>
                        <div class="thumbnails">
                            <%# RenderThumbnails(Eval("ImageUrls")) %>
                        </div>
                        <h3><%# Eval("Name") %></h3>
                        <p><b>Price:</b> ₹<%# Eval("Price", "{0:N2}") %></p>
                        <p><b>Available:</b> <%# Eval("Quantity") %></p>

                        <div class="desc-wrapper">
                            <p class="desc-text"><%# Eval("Description") %></p>
                            <button type="button" class="see-more-btn">See More</button>
                        </div>

                        <div class="cart-buttons">
                            <button class="btn cart-btn" onclick="addToCart(<%# Eval("ProductID") %>)">Add to Cart</button>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="pagination-controls">
            <asp:LinkButton ID="lnkPrev" runat="server" CssClass="pagination-btn" OnClick="lnkPrev_Click" Text="Previous" Enabled="false" />
            <asp:Label ID="lblPageInfo" runat="server" CssClass="page-info" Text="Page 1 of 1" />
            <asp:LinkButton ID="lnkNext" runat="server" CssClass="pagination-btn" OnClick="lnkNext_Click" Text="Next" Enabled="false" />
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <div id="imgOverlay" class="img-overlay" aria-hidden="true" role="dialog" aria-modal="true">
        <button type="button" class="img-overlay-close" aria-label="Close preview">&times;</button>
        <img id="imgOverlayPic" alt="" />
    </div>

    <script>
        function changeImage(thumbnail) {
            let productCard = thumbnail.closest('.product-card');
            let galleryImgs = productCard.querySelectorAll('.image-gallery img');

            galleryImgs.forEach(img => img.classList.remove('active'));
            galleryImgs.forEach(img => {
                if (img.src === thumbnail.src) {
                    img.classList.add('active');
                }
            });

            productCard.querySelectorAll('.thumbnails img')
                .forEach(img => img.classList.remove('active-thumb'));
            thumbnail.classList.add('active-thumb');
        }

        function addToCart(productId) {
            fetch("AccessoriesCollection.aspx/AddToCart", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=utf-8"
                },
                body: JSON.stringify({ productId: productId })
            })
                .then(res => res.json())
                .then(data => {
                    alert(data.d);
                    location.reload();
                })
                .catch(err => {
                    console.error(err);
                    alert('Error adding to cart');
                });
        }

        document.addEventListener("click", function (e) {
            if (e.target.classList.contains("see-more-btn")) {
                const wrapper = e.target.closest(".desc-wrapper");
                const text = wrapper.querySelector(".desc-text");

                text.classList.toggle("expanded");

                if (text.classList.contains("expanded")) {
                    e.target.textContent = "See Less";
                } else {
                    e.target.textContent = "See More";
                }
            }
        });

        (function () {
            let lastFocusedEl = null;
            let savedScrollY = 0;

            function bindImagePreviewHandlers(scope) {
                const root = scope || document;
                root.querySelectorAll('.image-gallery img').forEach(img => {
                    if (!img.dataset.previewBound) {
                        img.addEventListener('click', onPreviewOpen);
                        img.dataset.previewBound = '1';
                        img.style.cursor = 'zoom-in';
                    }
                });
            }

            function onPreviewOpen(e) {
                const overlay = document.getElementById('imgOverlay');
                const pic = document.getElementById('imgOverlayPic');
                lastFocusedEl = e.currentTarget;

                pic.src = e.currentTarget.src;
                pic.alt = e.currentTarget.alt || '';

                savedScrollY = window.scrollY;
                document.documentElement.classList.add('no-scroll');
                document.body.classList.add('no-scroll');
                document.body.style.top = `-${savedScrollY}px`;
                document.body.style.position = 'fixed';

                overlay.classList.add('open');
                overlay.querySelector('.img-overlay-close').focus();

                document.addEventListener('keydown', onEscToClose);
            }

            function onEscToClose(e) {
                if (e.key === 'Escape' || e.keyCode === 27) closeOverlay();
            }

            function closeOverlay() {
                const overlay = document.getElementById('imgOverlay');
                overlay.classList.remove('open');

                document.body.style.position = '';
                document.body.style.top = '';
                document.documentElement.classList.remove('no-scroll');
                document.body.classList.remove('no-scroll');
                window.scrollTo(0, savedScrollY);

                document.removeEventListener('keydown', onEscToClose);

                if (lastFocusedEl && lastFocusedEl.focus) lastFocusedEl.focus();
            }

            document.addEventListener('click', function (e) {
                const overlay = document.getElementById('imgOverlay');
                if (!overlay.classList.contains('open')) return;
                if (e.target && e.target.classList && e.target.classList.contains('img-overlay-close')) return closeOverlay();
                if (e.target && e.target.id === 'imgOverlay') return closeOverlay();
            });

            document.addEventListener('DOMContentLoaded', function () {
                bindImagePreviewHandlers(document);
            });
        })();
    </script>
</asp:Content>