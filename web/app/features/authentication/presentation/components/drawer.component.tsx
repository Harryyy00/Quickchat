import React, { useState } from 'react';
import { Drawer } from 'flowbite';
import type { DrawerOptions, DrawerInterface } from 'flowbite';

interface DrawerComponentProps {
  children?: React.ReactNode;
  position?: 'left' | 'right' | 'top' | 'bottom';
  title?: string;
}

export const DrawerComponent: React.FC<DrawerComponentProps> = ({
  children,
  position = 'left',
  title = 'Menu'
}) => {
  const [drawer, setDrawer] = useState<DrawerInterface | null>(null);

  React.useEffect(() => {
    const $targetEl = document.getElementById('drawer-example');
    const $triggerEl = document.getElementById('drawer-trigger');

    const options: DrawerOptions = {
      placement: position,
      backdrop: true,
      bodyScrolling: false,
      edge: false,
      edgeOffset: '',
      backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-30',
      onHide: () => {
        console.log('drawer is hidden');
      },
      onShow: () => {
        console.log('drawer is shown');
      },
      onToggle: () => {
        console.log('drawer has been toggled');
      },
    };

    if ($targetEl) {
      const drawer = new Drawer($targetEl, options);
      setDrawer(drawer);
    }

    return () => {
      if (drawer) {
        drawer.hide();
      }
    };
  }, [position]);

  const handleToggle = () => {
    if (drawer) {
      drawer.toggle();
    }
  };

  return (
    <>
      <button
        id="drawer-trigger"
        onClick={handleToggle}
        className="p-2 hover:bg-gray-100 rounded-md text-gray-500 hover:text-gray-900"
        aria-controls="drawer-example"
        aria-expanded="false"
      >
        <svg 
          className="w-6 h-6" 
          aria-hidden="true" 
          fill="currentColor" 
          viewBox="0 0 20 20" 
          xmlns="http://www.w3.org/2000/svg"
        >
          <path 
            fillRule="evenodd" 
            d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" 
            clipRule="evenodd"
          />
        </svg>
      </button>

      <div
        id="drawer-example"
        className="fixed top-0 left-0 z-40 h-screen p-4 overflow-y-auto transition-transform -translate-x-full bg-white w-80 dark:bg-gray-800"
        tabIndex={-1}
        aria-labelledby="drawer-label"
      >
        <h5
          id="drawer-label"
          className="inline-flex items-center mb-4 text-base font-semibold text-gray-500 dark:text-gray-400"
        >
          {title}
        </h5>
        <button
          onClick={handleToggle}
          type="button"
          className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 absolute top-2.5 right-2.5 inline-flex items-center justify-center dark:hover:bg-gray-600 dark:hover:text-white"
        >
          <svg
            className="w-3 h-3"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 14 14"
          >
            <path
              stroke="currentColor"
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
            />
          </svg>
          <span className="sr-only">Close menu</span>
        </button>
        <div className="py-4">
          {children}
        </div>
      </div>
    </>
  );
};