// Example: Collapsible lab descriptions (optional)
document.querySelectorAll('.lab-list li').forEach(item => {
  item.addEventListener('click', () => {
    const p = item.querySelector('p');
    p.style.display = p.style.display === 'none' ? 'block' : 'none';
  });
});

