import Link from 'next/link';

export default function Notification() {
  return (
    <>
    
      <h1>Notification</h1>
      <h2>
        <Link href="/">Back to home</Link>
      </h2>
      <div className = 'notification-image'></div>
    </>
  );
}