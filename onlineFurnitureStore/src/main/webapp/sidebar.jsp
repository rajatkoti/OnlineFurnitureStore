<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<section class="panel">
                          <div class="panel-body">
                              <input type="text" placeholder="Keyword Search" class="form-control">
                          </div>
                      </section>
                      <section class="panel">
                          <header class="panel-heading">
                              Category
                          </header>
                          <div class="panel-body">
                              <ul class="nav prod-cat">
                                 
                                  <li><a href="ProductController?action=get_products_by_category&category=Beanbags"><i class=" fa fa-angle-right"></i>BeanBags</a></li>
                                  <li><a href="ProductController?action=get_products_by_category&category=Beds"><i class=" fa fa-angle-right"></i>Beds</a></li>
                                  <li><a href="ProductController?action=get_products_by_category&category=Sofas"><i class=" fa fa-angle-right"></i>Sofas</a></li>
                                  <li><a href="ProductController?action=get_products_by_category&category=Collapsible_Wardrobes"><i class=" fa fa-angle-right"></i>Collapsible Wardrobes</a></li>
                                  <li><a href="ProductController?action=get_products_by_category&category=TV_Cabinets"><i class=" fa fa-angle-right"></i>TV Cabinets</a></li>
                                  <li><a href="ProductController?action=get_products_by_category&category=Coffee_and_Centre_Tables"><i class=" fa fa-angle-right"></i>Coffee And Center Tables</a></li>
                              </ul>
                          </div>
                      </section>
                       <section class="panel">
                          <header class="panel-heading">
                              Brands
                          </header>
                          <div class="panel-body">
                              <ul class="nav prod-cat">
                                  
                                  <li><a href="ProductController?action=get_products_by_brand&brand=Brastilo"><i class=" fa fa-angle-right"></i>Brastilo</a></li>
                                  <li><a href="ProductController?action=get_products_by_brand&brand=Dreams"><i class=" fa fa-angle-right"></i>Dreams</a></li>
                                  <li><a href="ProductController?action=get_products_by_brand&brand=Edra"><i class=" fa fa-angle-right"></i>Edra</a></li>
                                  <li><a href="ProductController?action=get_products_by_brand&brand=Henredon"><i class=" fa fa-angle-right"></i>Henredon</a></li>
                                  <li><a href="ProductController?action=get_products_by_brand&brand=Sedus"><i class=" fa fa-angle-right"></i>Sedus</a></li>
                              </ul>
                          </div>
                      </section>
                      <section class="panel">
                          <header class="panel-heading">
                              Price Range
                          </header>
                          <div class="panel-body sliders">
                              <div id="slider-range" class="slider"></div>
                              <div class="slider-info">
                                  <span id="slider-range-amount"></span>
                              </div>
                          </div>
                      </section>
                      <section class="panel">
                          <header class="panel-heading">
                              Filter
                          </header>
                          <div class="panel-body">
                              <form role="form product-form">
                                  <div class="form-group">
                                      <label>Brand</label>
                                      <select class="form-control">
                                          <option>Wallmart</option>
                                          <option>Catseye</option>
                                          <option>Moonsoon</option>
                                          <option>Textmart</option>
                                      </select>
                                  </div>
                                  <div class="form-group">
                                      <label>Color</label>
                                      <select class="form-control">
                                          <option>White</option>
                                          <option>Black</option>
                                          <option>Red</option>
                                          <option>Green</option>
                                      </select>
                                  </div>
                                  <div class="form-group">
                                      <label>Type</label>
                                      <select class="form-control">
                                          <option>Small</option>
                                          <option>Medium</option>
                                          <option>Large</option>
                                          <option>Extra Large</option>
                                      </select>
                                  </div>
                                  <button class="btn btn-primary" type="submit">Filter</button>
                              </form>
                          </div>
                      </section>