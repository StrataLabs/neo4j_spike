class PurchaseOrdersController < ApplicationController
  # GET /purchase_orders
  # GET /purchase_orders.xml
  def index
    @purchase_orders = PurchaseOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_orders }
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.xml
  def show
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # GET /purchase_orders/new
  # GET /purchase_orders/new.xml
  def new
    @purchase_order = PurchaseOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # GET /purchase_orders/1/edit
  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  # POST /purchase_orders
  # POST /purchase_orders.xml
  def create
    @purchase_order = PurchaseOrder.new(params[:purchase_order])

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to(@purchase_order, :notice => 'Purchase order was successfully created.') }
        format.xml  { render :xml => @purchase_order, :status => :created, :location => @purchase_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_orders/1
  # PUT /purchase_orders/1.xml
  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @purchase_order.update_attributes(params[:purchase_order])
        format.html { redirect_to(@purchase_order, :notice => 'Purchase order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.xml
  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_orders_url) }
      format.xml  { head :ok }
    end
  end
end
