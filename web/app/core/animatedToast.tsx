interface AnimatedAlertProps {
    showAlert: boolean;
    message: string;
    onClose: () => void;
  }

export const AnimatedAlert: React.FC<AnimatedAlertProps> = ({
    showAlert,
    message,
    onClose,
  }) => {
    return (
        <>
            {showAlert && (
            <div
                className="fixed top-5 right-5 bg-red-500 text-white p-4 w-96 rounded-lg shadow-lg animate-slide-in-right"
                role="alert"
            >
                <p className="font-bold">Error!</p>
                <p className="text-sm pb-6">{message}</p>
                <button
                    className="mt-2 bg-red-700 hover:bg-red-600 text-white font-semibold py-1 px-3 rounded"
                    onClick={onClose}
                >
                Close
                </button>
            </div>
            )}
        </>
    );
}

export default AnimatedAlert;
