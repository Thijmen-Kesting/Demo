import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true,
      view: {
        name: 'catalog',
        params: {}
      },
      cart: [],
      cartObj: {}
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.deleteItem = this.deleteItem.bind(this);
    this.findQuantity = this.findQuantity.bind(this);
  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));
    this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: {
        name,
        params
      }
    });
  }

  findQuantity(cart = this.state.cart.length > 0 ? this.state.cart : []) {
    if (this.state.cart.length === 0) return;
    const { cartObj } = this.state;
    for (let i = 0; i < cart.length; i++) {
      const { productId } = Object.fromEntries(Object.entries(cart[i]));
      if (!cartObj[productId]) {
        cartObj[productId] = 1;
        continue;
      } else if (cartObj[productId]) {
        cartObj[productId]++;
        continue;
      }
    }
    return cartObj;
  }

  async getCartItems() {
    try {
      const response = await fetch('/api/cart');
      const cart = await response.json();
      this.setState({
        cart
      }, this.findQuantity(this.state.cart));
    } catch (error) {
      console.error(error.message);
    }
  }

  async addToCart(product) {
    try {
      const productAdded = {
        productId: product.productId
      };
      const headers = new Headers();
      headers.append('Content-Type', 'application/json');
      const response = await fetch('/api/cart', {
        method: 'POST',
        body: JSON.stringify(productAdded),
        headers
      });
      const json = await response.json();
      this.setState(previous => {
        const updatedCart = [...previous.cart];
        updatedCart.push(json);
        // eslint-disable-next-line no-console
        console.log('UpdatedCart:', updatedCart);
        return {
          cart: updatedCart
        };
      }, this.findQuantity(this.state.cart));
    } catch (error) {
      console.error(error.message);
    }
  }

  async placeOrder(order) {
    try {
      const headers = new Headers();
      headers.append('Content-Type', 'application/json');
      await fetch('/api/orders', {
        method: 'POST',
        body: JSON.stringify(order),
        headers
      });
      this.setState({
        cart: [],
        cartObj: {}
      });
    } catch (error) {
      console.error(error.message);
    }
  }

  async deleteItem(cartItemId) {
    try {
      const headers = new Headers();
      headers.append('Content-Type', 'application/json');
      await fetch(`/api/cartItems/${cartItemId}`, {
        method: 'DELETE',
        headers
      });
      this.setState(previous => {
        const updatedCart = [...previous.cart];
        const findIndex = updatedCart.findIndex(item => item.cartItemId === cartItemId);
        updatedCart.splice(findIndex, 1);
        return {
          cart: updatedCart
        };
      }, this.findQuantity(this.state.cart));
    } catch (error) {
      console.error(error.message);
    }
  }

  render() {
    return (
      <Router>
        <Header
          cartItemCount={this.state.cart.length} />
        <Switch>
          <Route path="/cart" render={props =>
            <React.Fragment>
              <CartSummary
                deleteItem={this.deleteItem}
                cart={this.state.cart}
                quantity={this.state.cartObj} />
            </React.Fragment>
          } />
          <Route path="/checkout" render={props =>
            <React.Fragment>
              <CheckoutForm
                {...props}
                cart={this.state.cart}
                placeOrder={this.placeOrder}
                quantity={this.state.cartObj} />
            </React.Fragment>
          } />
          <Route path="/:productId" render={props =>
            <React.Fragment>
              <ProductDetails
                params={this.state.view.params}
                addToCart={this.addToCart}
                quantity={this.state.cartObj} />
            </React.Fragment>
          } />
          <Route path="/" render={props =>
            <React.Fragment>
              <ProductList
                setView={this.setView} />
            </React.Fragment>
          } />
          <Route render={() => <div className="m-4 h1"><em>404:</em> Page not found</div>} />
        </Switch>
      </Router>
    );
  }
}

export default App;
