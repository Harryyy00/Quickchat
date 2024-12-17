
"use client";
import { Provider } from 'react-redux';
import { store } from '@/app/store';  // Adjust path if needed
import { HomePage } from './pages/home';

export default function MyApp() {
    return (
      <Provider store={store}>
        <HomePage/> 
      </Provider>
    );
}
